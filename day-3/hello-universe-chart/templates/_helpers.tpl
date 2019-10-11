{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "hello-universe-chart.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "hello-universe-chart.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "hello-universe-chart.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "hello-universe-chart.labels" -}}
app.kubernetes.io/name: {{ include "hello-universe-chart.name" . }}
helm.sh/chart: {{ include "hello-universe-chart.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- if .Chart.AppVersion -}}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end -}}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}


{{/*
Renders Configmap
*/}}
{{- define "hello-universe-chart.configmap" -}}
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ .deploymentConfig.deploymentName }}
  namespace: {{ .namespace }}
data:
  {{ toYaml .deploymentConfig.configMap -}}
{{ end }}

{{/*
Renders Infra Configmap
*/}}
{{- define "hello-universe-chart.infra-configmap" -}}
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ .deploymentConfig.deploymentName }}-infra
  namespace: {{ .namespace }}
data:
  # Iterate on all required keys of .deploymentConfig.infraConfigMap and
  # for each key, pull the value expression and
  # lookup that expression in .infra values
  {{ $infra := .infra -}}
  {{ range $configKey, $configValue := .deploymentConfig.infraConfigMap }}
  {{ $configValue := trimPrefix "$" $configValue }}
  {{ $actualConfigValue := pluck $configValue $infra | first }}
  {{ $configKey -}}: {{$actualConfigValue | quote}}
  {{ end }}
{{ end }}


{{/*
Renders Secret
*/}}
{{- define "hello-universe-chart.secrets" -}}
apiVersion: v1
kind: Secret
type: Opaque
metadata:
  name: {{ .deploymentConfig.deploymentName }}
  namespace: {{ .namespace }}
data:
  {{ toYaml .deploymentConfig.secrets -}}
{{ end }}

{{- define "hello-universe-chart.podAnnotations" -}}
{{- $deploymentData := . }}
annotations:
  checksum/infra-configmap: {{ include "hello-universe-chart.infra-configmap" $deploymentData | sha256sum }}
  checksum/configmap: {{ include "hello-universe-chart.configmap" $deploymentData | sha256sum }}
  checksum/secrets: {{ include "hello-universe-chart.secrets" $deploymentData | sha256sum }}
{{- end -}}
