{{/*
Render a container spec.

Params (dict):
  - root (root context; also accessible as $root inside the helper)
  - container (container configuration object)
  - containerName (name of the container)

Container.env shapes:
  - List form (legacy, emitted verbatim): [{name, value|valueFrom}, ...]
  - Map form: {NAME: "string"} or {NAME: {secretKeyRef|configMapKeyRef|fieldRef: {...}}}
    In map form, scalar values and the valueFrom block are passed through `tpl`
    with the root context, so templated references (e.g. `{{ include ... }}`)
    expand. Nil values fail fast. Keys are emitted in sorted order.
    secretKeyRef auto-expansion: when secretKeyRef.name matches a key in
    .Values.secrets, the name is automatically expanded via common.helpers.secretName
    (i.e. prefixed with fullname, or replaced by existingSecret if set).
    Set secretKeyRef.expandObjectName=false to disable this behavior.

Container.ports:
  - Map form: {portName: {containerPort|port, protocol}}. Emitted sorted.
*/}}
{{- define "common.helpers.container" -}}
  {{- $root := .root -}}
  {{- $container := .container -}}
  {{- $containerName := .containerName -}}
  {{- $imageConfig := $container.image | default dict -}}
  {{- if $container.imageSelector -}}
    {{- $imageConfig = index $root.Values $container.imageSelector | default dict -}}
  {{- end -}}
- name: {{ $containerName }}
  image: "{{ $imageConfig.repository }}:{{ $imageConfig.tag | default $root.Chart.AppVersion }}"
  imagePullPolicy: {{ $imageConfig.pullPolicy | default "IfNotPresent" }}
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
    {{- range $portName := keys $container.ports | sortAlpha }}
    {{- $port := index $container.ports $portName }}
    - name: {{ $portName }}
      containerPort: {{ required (printf "container %q port %q: containerPort (or port) is required" $containerName $portName) ($port.containerPort | default $port.port) }}
      protocol: {{ include "common.helpers.protocol" ($port.protocol | default "TCP") }}
    {{- end }}
  {{- end }}
  {{- if $container.env }}
  env:
    {{- if kindIs "map" $container.env }}
      {{- range $envName := keys $container.env | sortAlpha }}
        {{- $envValue := index $container.env $envName }}
        {{- if kindIs "invalid" $envValue }}
          {{- $msg := printf "container %s env %s: value is nil (did you forget a value, or mean to use valueFrom?)" $containerName $envName -}}
          {{- fail $msg }}
        {{- end }}
    - name: {{ $envName }}
        {{- if kindIs "map" $envValue }}
          {{- $processedValue := deepCopy $envValue -}}
          {{- /* Auto-expand secretKeyRef.name when it matches a .Values.secrets key */ -}}
          {{- if hasKey $processedValue "secretKeyRef" -}}
            {{- $ref := index $processedValue "secretKeyRef" -}}
            {{- $rawName := $ref.name | default "" -}}
            {{- $expand := true -}}
            {{- if hasKey $ref "expandObjectName" -}}
              {{- $expand = $ref.expandObjectName -}}
            {{- end -}}
            {{- if and $expand (hasKey ($root.Values.secrets | default dict) $rawName) -}}
              {{- $_ := set $ref "name" (include "common.helpers.secretName" (dict "root" $root "name" $rawName)) -}}
            {{- end -}}
            {{- $_ := set $processedValue "secretKeyRef" (omit $ref "expandObjectName") -}}
          {{- end -}}
          {{- $rendered := tpl (toYaml $processedValue) $root }}
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
    {{- toYaml (mergeOverwrite (dict "periodSeconds" 10 "timeoutSeconds" 5 "failureThreshold" 3 "successThreshold" 1) $container.livenessProbe) | nindent 4 }}
  {{- end }}
  {{- if $container.readinessProbe }}
  readinessProbe:
    {{- toYaml (mergeOverwrite (dict "periodSeconds" 10 "timeoutSeconds" 5 "failureThreshold" 3 "successThreshold" 1) $container.readinessProbe) | nindent 4 }}
  {{- end }}
  {{- if $container.startupProbe }}
  startupProbe:
    {{- toYaml (mergeOverwrite (dict "periodSeconds" 10 "timeoutSeconds" 5 "failureThreshold" 30 "successThreshold" 1) $container.startupProbe) | nindent 4 }}
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
