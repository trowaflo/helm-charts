{{/*
Render a container spec
Params:
  - $ (root context)
  - container (container configuration object)
  - containerName (name of the container)
*/}}
{{- define "common.helpers.container" -}}
  {{- $root := .root -}}
  {{- $container := .container -}}
  {{- $containerName := .containerName -}}
- name: {{ $containerName }}
  image: "{{ $container.image.repository }}:{{ $container.image.tag | default $root.Chart.AppVersion }}"
  imagePullPolicy: {{ $container.image.pullPolicy | default "IfNotPresent" }}
  {{- if $container.command }}
  command:
    {{- toYaml $container.command | nindent 4 }}
  {{- end }}
  {{- if $container.args }}
  args:
    {{- toYaml $container.args | nindent 4 }}
  {{- end }}
  {{- if $container.ports }}
  ports:
    {{- range $portName, $port := $container.ports }}
    - name: {{ $portName }}
      containerPort: {{ required (printf "container %q port %q: containerPort (or port) is required" $containerName $portName) ($port.containerPort | default $port.port) }}
      protocol: {{ include "common.helpers.protocol" ($port.protocol | default "TCP") }}
    {{- end }}
  {{- end }}
  {{- if $container.env }}
  env:
    {{- if kindIs "map" $container.env }}
      {{- range $envName, $envValue := $container.env }}
    - name: {{ $envName }}
        {{- if kindIs "map" $envValue }}
          {{- $rendered := tpl (toYaml $envValue) $root }}
      valueFrom:
        {{- $rendered | nindent 8 }}
        {{- else }}
      value: {{ tpl ($envValue | toString) $root | quote }}
        {{- end }}
      {{- end }}
    {{- else }}
    {{- toYaml $container.env | nindent 4 }}
    {{- end }}
  {{- end }}
  {{- if $container.envFrom }}
  envFrom:
    {{- toYaml $container.envFrom | nindent 4 }}
  {{- end }}
  {{- if $container.livenessProbe }}
  livenessProbe:
    {{- toYaml $container.livenessProbe | nindent 4 }}
  {{- end }}
  {{- if $container.readinessProbe }}
  readinessProbe:
    {{- toYaml $container.readinessProbe | nindent 4 }}
  {{- end }}
  {{- if $container.startupProbe }}
  startupProbe:
    {{- toYaml $container.startupProbe | nindent 4 }}
  {{- end }}
  {{- if $container.volumeMounts }}
  volumeMounts:
    {{- toYaml $container.volumeMounts | nindent 4 }}
  {{- end }}
  {{- if $container.resources }}
  resources:
    {{- toYaml $container.resources | nindent 4 }}
  {{- end }}
  securityContext:
    {{- $defaultSecCtx := dict
        "allowPrivilegeEscalation" false
        "runAsNonRoot" true
        "readOnlyRootFilesystem" true
        "capabilities" (dict "drop" (list "ALL"))
    -}}
    {{- $secCtx := mergeOverwrite (deepCopy $defaultSecCtx) ($container.securityContext | default dict) -}}
    {{- toYaml $secCtx | nindent 4 }}
{{- end -}}
