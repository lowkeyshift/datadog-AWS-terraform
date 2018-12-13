provider "datadog" {
  api_key = "${var.dd_api_key}"
  app_key = "${var.dd_app_key}"
}

# resource "datadog_monitor" "watchdog" {
#     name               = "[${var.app_name}] [Watchdog] {{event.title}}"
#     type               = "event alert"
#     message            = "Monitor triggered. Notify: @slack-demos"
#     escalation_message = "Escalation message @slack-demos"

#     query = "events('priority:all sources:watchdog tags:story_type:service,env:datadoghq.com,service:${var.app_name},availability-zone:_aggregate').by('availability-zone,service,resource_name').rollup('count').last('30m') > 0"

#     notify_no_data    = false
#     renotify_interval = 60

#     notify_audit = false
#     timeout_h    = 0
#     include_tags = true


#     tags = ["app-name:${var.app_name}", "created-by:terraform"]
# }

# resource "datadog_monitor" "apdex" {
#     name               = "[${var.app_name}] [APM] Apdex low on ${var.app_name}"
#     type               = "metric alert"
#     message            = "Monitor triggered. Notify: @slack-demos"
#     escalation_message = "Escalation message @slack-demos"

#     query = "avg(last_30m):avg:trace.pylons.request.apdex.by.service{env:datad0g.com,service:${var.app_name}} < 0.6"

#     thresholds {
#         critical = 0.6
#         warning = 0.7
#     }

#     notify_no_data    = false
#     renotify_interval = 60

#     notify_audit = false
#     timeout_h    = 0
#     include_tags = true


#     tags = ["app-name:${var.app_name}", "created-by:terraform"]
# }