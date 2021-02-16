{{/*
Expand the name of the chart for reddit scrapper.
*/}}
{{- define "scrapper.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Expand the name of the chart for scheduler.
*/}}
{{- define "scheduler.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Expand the name of the chart. for postscrapper
*/}}
{{- define "postscrapper.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Expand the name of the embedding.
*/}}
{{- define "embedding.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Expand the name of ownmetrics.
*/}}
{{- define "ownmetrics.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Expand the name of the celerymetrisc.
*/}}
{{- define "celerymetrics.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Expand the name of the chart. databaseworker
*/}}
{{- define "databaseworker.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name for reddit scrapper.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "scrapper.fullname" -}}
{{- if .Values.scrapper.fullnameOverride }}
{{- .Values.scrapper.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- printf "%s-%s" .Release.Name .Values.scrapper.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.scrapper.name | trunc 63 | trimSuffix "-" -}}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create a default fully qualified app name for scheduler.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "scheduler.fullname" -}}
{{- if .Values.scheduler.fullnameOverride }}
{{- .Values.scheduler.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- printf "%s-%s" .Release.Name .Values.scheduler.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.scheduler.name | trunc 63 | trimSuffix "-" -}}
{{- end }}
{{- end }}
{{- end }}


{{/*
Create a default fully qualified app name for postscrapper.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "postscrapper.fullname" -}}
{{- if .Values.postscrapper.fullnameOverride }}
{{- .Values.postscrapper.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- printf "%s-%s" .Release.Name .Values.postscrapper.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.postscrapper.name | trunc 63 | trimSuffix "-" -}}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create a default fully qualified app name for embedding.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "embedding.fullname" -}}
{{- if .Values.embedding.fullnameOverride }}
{{- .Values.embedding.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- printf "%s-%s" .Release.Name .Values.embedding.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.embedding.name | trunc 63 | trimSuffix "-" -}}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create a default fully qualified app name. for ownmetrics
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "ownmetrics.fullname" -}}
{{- if .Values.ownmetrics.fullnameOverride }}
{{- .Values.ownmetrics.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- printf "%s-%s" .Release.Name .Values.ownmetrics.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.ownmetrics.name | trunc 63 | trimSuffix "-" -}}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create a default fully qualified app celerymetrics.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "celerymetrics.fullname" -}}
{{- if .Values.celerymetrics.fullnameOverride }}
{{- .Values.celerymetrics.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- printf "%s-%s" .Release.Name .Values.celerymetrics.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.celerymetrics.name | trunc 63 | trimSuffix "-" -}}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create a default fully qualified app name. databaseworker
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "databaseworker.fullname" -}}
{{- if .Values.databaseworker.fullnameOverride }}
{{- .Values.databaseworker.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- printf "%s-%s" .Release.Name .Values.databaseworker.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.databaseworker.name | trunc 63 | trimSuffix "-" -}}
{{- end }}
{{- end }}
{{- end }}


{{/*
Create chart name and version as used by the chart label. for scrapper
*/}}
{{- define "scrapper.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label. for scheduler
*/}}
{{- define "scheduler.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label. for postscrapper
*/}}
{{- define "postscrapper.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label for embedding.
*/}}
{{- define "embedding.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label. for ownmetrics
*/}}
{{- define "ownmetrics.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label. for celerymetrics
*/}}
{{- define "celerymetrics.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label. databaseworker
*/}}
{{- define "databaseworker.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels for reddit scrapper
*/}}
{{- define "scrapper.labels" -}}
helm.sh/chart: {{ include "scrapper.chart" . }}
{{ include "scrapper.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Common labels for scheduler
*/}}
{{- define "scheduler.labels" -}}
helm.sh/chart: {{ include "scheduler.chart" . }}
{{ include "scheduler.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Common labels for postscrapper
*/}}
{{- define "postscrapper.labels" -}}
helm.sh/chart: {{ include "postscrapper.chart" . }}
{{ include "postscrapper.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Common labels for embedding
*/}}
{{- define "embedding.labels" -}}
helm.sh/chart: {{ include "embedding.chart" . }}
{{ include "embedding.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Common labels for own metrics
*/}}
{{- define "ownmetrics.labels" -}}
helm.sh/chart: {{ include "ownmetrics.chart" . }}
{{ include "ownmetrics.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Common labels for celerymetrics
*/}}
{{- define "celerymetrics.labels" -}}
helm.sh/chart: {{ include "celerymetrics.chart" . }}
{{ include "celerymetrics.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Common labels databaseworker
*/}}
{{- define "databaseworker.labels" -}}
helm.sh/chart: {{ include "databaseworker.chart" . }}
{{ include "databaseworker.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels for reddit scrapper
*/}}
{{- define "scrapper.selectorLabels" -}}
app.kubernetes.io/name: {{ include "scrapper.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Selector labels for sheduler
*/}}
{{- define "scheduler.selectorLabels" -}}
app.kubernetes.io/name: {{ include "scheduler.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Selector labels for postscrapper
*/}}
{{- define "postscrapper.selectorLabels" -}}
app.kubernetes.io/name: {{ include "postscrapper.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Selector labels for embedding
*/}}
{{- define "embedding.selectorLabels" -}}
app.kubernetes.io/name: {{ include "embedding.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Selector labels for ownmetrics
*/}}
{{- define "ownmetrics.selectorLabels" -}}
app.kubernetes.io/name: {{ include "ownmetrics.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Selector labels for celerymetrics
*/}}
{{- define "celerymetrics.selectorLabels" -}}
app.kubernetes.io/name: {{ include "celerymetrics.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Selector labels databaseworker
*/}}
{{- define "databaseworker.selectorLabels" -}}
app.kubernetes.io/name: {{ include "databaseworker.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}


{{- define "celery.exporter.url" -}}
{{- if .Values.rabbitmq.clustering.k8s_domain }}
    {{- printf "amqp://%s:%s@%s.%s.svc.%s:%s" .Values.rabbitmq.auth.username .Values.rabbitmq.auth.password .Values.rabbitmq.fullnameOverride .Release.Namespace .Values.rabbitmq.clustering.k8s_domain .Values.rabbitmq.service.port }}
{{ else }}
    {{- printf "amqp://%s:%s@%s.%s.svc:%s" .Values.rabbitmq.auth.username .Values.rabbitmq.auth.password .Values.rabbitmq.fullnameOverride .Release.Namespace .Values.rabbitmq.service.port }}
{{ end }}
{{- end }}

{{- define "database.hostname" -}}
    {{- printf "%s.%s.svc.%s" .Values.mongodb.fullnameOverride .Release.Namespace .Values.mongodb.clusterDomain }}
{{- end -}}