# CHANGELOG
{{ range .Versions }}
<a name="{{ .Tag.Name }}"></a>
## {{ if .Tag.Previous }}[{{ .Tag.Name }}]({{ $.Info.RepositoryURL }}/compare/{{ .Tag.Previous.Name }}...{{ .Tag.Name }}){{ else }}{{ .Tag.Name }}{{ end }} ({{ datetime "2006-01-02" .Tag.Date }})
{{ range .Commits -}}
{{- if not (hasPrefix .Subject "Merge pull") -}}
{{- if not (contains .Subject "README") -}}
{{- if not (hasSuffix .Subject "[ci skip]") -}}
{{- if not (hasSuffix .Subject "[skip ci]") -}}
* {{ .Subject }}
{{ end -}}
{{ end -}}
{{ end -}}
{{ end -}}
{{ end -}}
{{ end -}}
