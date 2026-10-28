{{- /*
Cilium network policies of one namespace: a baseline that puts every pod in
default deny, then one policy per declared flow, its `why` as description.
Flows shared by every app (DNS, gateway, scrape) belong to a cluster-wide
baseline outside this chart.
Only the baseline denies: a flow policy keeps enableDefaultDeny false, since
Cilium otherwise denies everything else for its pods as soon as it exists. The
baseline goes in a later ArgoCD sync wave, so a sync applied halfway leaves the
namespace open instead of cutting flows whose policy is not there yet.
*/ -}}
{{- define "common.manifests.networkPolicy" -}}
{{- $np := .Values.networkPolicy | default dict }}
{{- if $np.enabled }}
{{- $ns := .Release.Namespace }}
---
# Namespace baseline: every pod of the namespace in default deny, in and out.
apiVersion: cilium.io/v2
kind: CiliumNetworkPolicy
metadata:
  name: {{ include "common.networkPolicy.name" (dict "root" $ "suffix" "baseline") }}
  labels:
    {{- include "common.helpers.labels" $ | nindent 4 }}
  annotations:
    argocd.argoproj.io/sync-wave: "1"
spec:
  description: Default deny for every pod of the namespace, present or future; the other policies of this release and the cluster-wide baseline open the declared flows.
  endpointSelector: {}
  enableDefaultDeny:
    ingress: true
    egress: true
  # An empty rule turns enforcement on and allows nothing.
  ingress:
    - {}
  egress:
    - {}
{{- range $i, $r := $np.egress }}
  {{- /* Same checks as the network-policy schema: a chart on common.loader has none. */}}
  {{- if not (has $r.to (list "kube-apiserver" "world" "internet" "fqdn" "cidr" "cidrGroup" "pods")) }}
    {{- fail (printf "networkPolicy.egress[%d]: to must be kube-apiserver, world, internet, fqdn, cidr, cidrGroup or pods" $i) }}
  {{- end }}
  {{- if not $r.why }}
    {{- fail (printf "networkPolicy.egress[%d]: why is required" $i) }}
  {{- end }}
  {{- /* A quoted "false" is truthy: without the schema, only a real boolean may open every port. */}}
  {{- if and (hasKey $r "allPorts") (not (kindIs "bool" $r.allPorts)) }}
    {{- fail (printf "networkPolicy.egress[%d]: allPorts must be a boolean" $i) }}
  {{- end }}
  {{- if and $r.allPorts (not (has $r.to (list "cidr" "cidrGroup"))) }}
    {{- fail (printf "networkPolicy.egress[%d]: allPorts is for cidr and cidrGroup only" $i) }}
  {{- end }}
  {{- if and $r.allPorts $r.ports }}
    {{- fail (printf "networkPolicy.egress[%d]: allPorts and ports exclude each other" $i) }}
  {{- end }}
  {{- $ports := $r.ports }}
  {{- if and (not $ports) (eq $r.to "kube-apiserver") }}{{ $ports = list 6443 }}{{ end }}
  {{- if and (not $ports) (eq $r.to "fqdn") }}{{ $ports = list 443 }}{{ end }}
  {{- /* allPorts must be explicit: a forgotten ports list fails instead of opening every port. */}}
  {{- if and (not $ports) (not $r.allPorts) (has $r.to (list "world" "cidr" "cidrGroup" "pods")) }}
    {{- fail (printf "networkPolicy.egress[%d]: to %s needs ports" $i $r.to) }}
  {{- end }}
  {{- $portsText := join "," $ports }}
  {{- if not $ports }}{{ $portsText = ternary (printf "every %s port" $r.protocol) "every port" (not (empty $r.protocol)) }}{{ end }}
  {{- if and (eq $r.to "fqdn") (not $r.names) }}
    {{- fail (printf "networkPolicy.egress[%d]: to fqdn needs names" $i) }}
  {{- end }}
  {{- if and (eq $r.to "cidr") (not $r.cidrs) }}
    {{- fail (printf "networkPolicy.egress[%d]: to cidr needs cidrs" $i) }}
  {{- end }}
  {{- if and (eq $r.to "cidrGroup") (not $r.groups) }}
    {{- fail (printf "networkPolicy.egress[%d]: to cidrGroup needs groups" $i) }}
  {{- end }}
  {{- include "common.networkPolicy.groups" (dict "groups" $r.groups "where" (printf "networkPolicy.egress[%d]" $i)) }}
  {{- $peerNs := $r.namespace | default $ns }}
  {{- /* Description: direction, local pods, destination, ports, then why. */}}
  {{- $who := include "common.networkPolicy.who" (dict "labels" $r.select "namespace" $ns) }}
  {{- $dest := "" }}
  {{- if eq $r.to "kube-apiserver" }}{{ $dest = "the Kubernetes API" }}
  {{- else if eq $r.to "world" }}{{ $dest = "the Internet" }}
  {{- else if eq $r.to "internet" }}{{ $dest = "the Internet except private ranges" }}
  {{- else if eq $r.to "fqdn" }}{{ $dest = join ", " $r.names }}
  {{- else if eq $r.to "cidr" }}{{ $dest = join ", " $r.cidrs }}
  {{- else if eq $r.to "cidrGroup" }}{{ $dest = printf "CIDR groups %s" (join ", " $r.groups) }}
  {{- else }}{{ $dest = include "common.networkPolicy.who" (dict "labels" $r.selector "namespace" $peerNs) }}
  {{- end }}
---
# Egress entry: the outbound flow of the selected local pods.
apiVersion: cilium.io/v2
kind: CiliumNetworkPolicy
metadata:
  name: {{ include "common.networkPolicy.name" (dict "root" $ "suffix" (printf "egress-%d" $i)) }}
  labels:
    {{- include "common.helpers.labels" $ | nindent 4 }}
spec:
  description: {{ printf "Out: %s to %s on %s. %s" $who $dest $portsText $r.why | quote }}
  endpointSelector:
    {{- include "common.networkPolicy.selector" $r.select | nindent 4 }}
  enableDefaultDeny:
    ingress: false
    egress: false
  egress:
  {{- if eq $r.to "kube-apiserver" }}
    - toEntities:
        - kube-apiserver
  {{- else if eq $r.to "world" }}
    - toEntities:
        - world
  {{- else if eq $r.to "internet" }}
    # The world entity also holds the LAN: the private ranges stay closed, a LAN
    # target needs its own cidr or cidrGroup entry.
    - toCIDRSet:
        - cidr: 0.0.0.0/0
          except:
            - 10.0.0.0/8
            - 172.16.0.0/12
            - 192.168.0.0/16
  {{- else if eq $r.to "fqdn" }}
    # Matched against the names the pod resolves through the Cilium DNS proxy,
    # turned on for these pods only by the DNS rule below.
    - toFQDNs:
    {{- range $r.names }}
        - matchName: {{ . | quote }}
    {{- end }}
  {{- else if eq $r.to "cidr" }}
    - toCIDR:
        {{- toYaml $r.cidrs | nindent 8 }}
  {{- else if eq $r.to "cidrGroup" }}
    # CiliumCIDRGroup objects, cluster-scoped: one place holds the addresses.
    - toCIDRSet:
    {{- range $r.groups }}
        - cidrGroupRef: {{ . | quote }}
    {{- end }}
  {{- else if eq $r.to "pods" }}
    - toEndpoints:
        {{- include "common.networkPolicy.peer" (dict "selector" $r.selector "namespace" $peerNs) | nindent 8 }}
  {{- end }}
  {{- $rulePorts := $ports | default (ternary (list 0) list (not (empty $r.protocol))) }}
  {{- if $rulePorts }}
      {{- include "common.networkPolicy.ports" (dict "ports" $rulePorts "protocol" $r.protocol) | nindent 6 }}
  {{- end }}
  {{- if eq $r.to "fqdn" }}
    - toEndpoints:
        - matchLabels:
            k8s:io.kubernetes.pod.namespace: kube-system
            k8s-app: kube-dns
      toPorts:
        - ports:
            - port: "53"
              protocol: ANY
          rules:
            dns:
              - matchPattern: "*"
  {{- end }}
  {{- if and (eq $r.to "pods") (eq $peerNs $ns) }}
---
# Same-namespace peer: the receiving side, so one egress entry opens both.
apiVersion: cilium.io/v2
kind: CiliumNetworkPolicy
metadata:
  name: {{ include "common.networkPolicy.name" (dict "root" $ "suffix" (printf "egress-%d-peer" $i)) }}
  labels:
    {{- include "common.helpers.labels" $ | nindent 4 }}
spec:
  description: {{ printf "In: %s from %s on %s. %s" $dest $who $portsText $r.why | quote }}
  endpointSelector:
    {{- include "common.networkPolicy.selector" $r.selector | nindent 4 }}
  enableDefaultDeny:
    ingress: false
    egress: false
  ingress:
    - fromEndpoints:
        {{- include "common.networkPolicy.peer" (dict "selector" $r.select "namespace" $ns) | nindent 8 }}
      {{- include "common.networkPolicy.ports" (dict "ports" $ports "protocol" $r.protocol) | nindent 6 }}
  {{- end }}
{{- end }}
{{- range $i, $r := $np.ingress }}
  {{- if not (has $r.from (list "pods" "cidr" "cidrGroup")) }}
    {{- fail (printf "networkPolicy.ingress[%d]: from must be pods, cidr or cidrGroup" $i) }}
  {{- end }}
  {{- if not $r.why }}
    {{- fail (printf "networkPolicy.ingress[%d]: why is required" $i) }}
  {{- end }}
  {{- if not $r.ports }}
    {{- fail (printf "networkPolicy.ingress[%d]: from %s needs ports" $i $r.from) }}
  {{- end }}
  {{- if and (eq $r.from "cidr") (not $r.cidrs) }}
    {{- fail (printf "networkPolicy.ingress[%d]: from cidr needs cidrs" $i) }}
  {{- end }}
  {{- if and (eq $r.from "cidrGroup") (not $r.groups) }}
    {{- fail (printf "networkPolicy.ingress[%d]: from cidrGroup needs groups" $i) }}
  {{- end }}
  {{- include "common.networkPolicy.groups" (dict "groups" $r.groups "where" (printf "networkPolicy.ingress[%d]" $i)) }}
  {{- $who := include "common.networkPolicy.who" (dict "labels" $r.select "namespace" $ns) }}
  {{- $src := "" }}
  {{- if eq $r.from "cidr" }}{{ $src = join ", " $r.cidrs }}
  {{- else if eq $r.from "cidrGroup" }}{{ $src = printf "CIDR groups %s" (join ", " $r.groups) }}
  {{- else }}{{ $src = include "common.networkPolicy.who" (dict "labels" $r.selector "namespace" ($r.namespace | default $ns)) }}
  {{- end }}
---
# Ingress entry: the inbound flow to the selected local pods.
apiVersion: cilium.io/v2
kind: CiliumNetworkPolicy
metadata:
  name: {{ include "common.networkPolicy.name" (dict "root" $ "suffix" (printf "ingress-%d" $i)) }}
  labels:
    {{- include "common.helpers.labels" $ | nindent 4 }}
spec:
  description: {{ printf "In: %s from %s on %s. %s" $who $src (join "," $r.ports) $r.why | quote }}
  endpointSelector:
    {{- include "common.networkPolicy.selector" $r.select | nindent 4 }}
  enableDefaultDeny:
    ingress: false
    egress: false
  ingress:
  {{- if eq $r.from "pods" }}
    - fromEndpoints:
        {{- include "common.networkPolicy.peer" (dict "selector" $r.selector "namespace" ($r.namespace | default $ns)) | nindent 8 }}
  {{- else if eq $r.from "cidr" }}
    - fromCIDR:
        {{- toYaml $r.cidrs | nindent 8 }}
  {{- else if eq $r.from "cidrGroup" }}
    - fromCIDRSet:
    {{- range $r.groups }}
        - cidrGroupRef: {{ . | quote }}
    {{- end }}
  {{- end }}
      {{- include "common.networkPolicy.ports" (dict "ports" $r.ports "protocol" $r.protocol) | nindent 6 }}
{{- end }}
{{- end }}
{{- end -}}

{{- /* CIDR group names must be valid object names, or the reference matches nothing;
the network-policy schema checks the same, a chart on common.loader has no schema. */ -}}
{{- define "common.networkPolicy.groups" -}}
  {{- range $j, $g := .groups -}}
    {{- if not (and (kindIs "string" $g) (le (len $g) 253) (regexMatch "^[a-z0-9]([-a-z0-9]*[a-z0-9])?(\\.[a-z0-9]([-a-z0-9]*[a-z0-9])?)*$" $g)) -}}
      {{- fail (printf "%s.groups[%d]: %v is not a valid CiliumCIDRGroup name (DNS-1123 subdomain, 253 characters at most)" $.where $j $g) -}}
    {{- end -}}
  {{- end -}}
{{- end -}}

{{- /* Policy name: fullname plus suffix, the suffix kept whole when the prefix is cut. */ -}}
{{- define "common.networkPolicy.name" -}}
  {{- $prefix := include "common.helpers.fullname" .root | trunc (int (sub 62 (len .suffix))) | trimSuffix "-" }}
  {{- printf "%s-%s" $prefix .suffix }}
{{- end -}}

{{- /* Human-readable pod set for descriptions: "app=x in ns" or "every pod of ns". */ -}}
{{- define "common.networkPolicy.who" -}}
  {{- if .labels -}}
    {{- $pairs := list -}}
    {{- range $k := keys .labels | sortAlpha -}}
      {{- $pairs = append $pairs (printf "%s=%s" $k (index $.labels $k)) -}}
    {{- end -}}
    {{- printf "pods %s in %s" (join "," $pairs) .namespace -}}
  {{- else -}}
    {{- printf "every pod of %s" .namespace -}}
  {{- end -}}
{{- end -}}

{{- /* Endpoint selector from a matchLabels map; an empty map selects every pod. */ -}}
{{- define "common.networkPolicy.selector" -}}
  {{- if . -}}
matchLabels:
    {{- toYaml . | nindent 2 }}
  {{- else -}}
{}
  {{- end }}
{{- end -}}

{{- /* Peer pods: matchLabels plus the namespace label, Cilium reads a selector
without it as the policy namespace. */ -}}
{{- define "common.networkPolicy.peer" -}}
  {{- $labels := deepCopy (.selector | default dict) }}
  {{- $_ := set $labels "k8s:io.kubernetes.pod.namespace" .namespace -}}
- matchLabels:
    {{- toYaml $labels | nindent 4 }}
{{- end -}}

{{- /* toPorts block, nothing when the list is empty; port 0 matches every port
of the protocol. */ -}}
{{- define "common.networkPolicy.ports" -}}
  {{- if .ports -}}
toPorts:
  - ports:
    {{- range .ports }}
      - port: {{ . | toString | quote }}
        protocol: {{ $.protocol | default "TCP" }}
    {{- end }}
  {{- end }}
{{- end -}}
