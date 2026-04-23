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
      containerPort: {{ $port.containerPort | default $port.port }}
      protocol: {{ $port.protocol | default "TCP" | upper }}
    {{- end }}
  {{- end }}
  {{- if $container.env }}
  env:
    {{- toYaml $container.env | nindent 4 }}
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
  {{- if $container.securityContext }}
  securityContext:
    {{- toYaml $container.securityContext | nindent 4 }}
  {{- end }}
{{- end -}}
