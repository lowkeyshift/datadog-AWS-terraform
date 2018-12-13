# module "monitor_mcnulty_query" {
#     source = "./modules/monitor_app"
#     app_name = "mcnulty-query"
#     dd_api_key = "${var.datadog_api_key}"
#     dd_app_key = "${var.datadog_app_key}"
# }

# module "monitor_mcnulty_web" {
#     source = "./modules/monitor_app"
#     app_name = "mcnulty-web"
#     dd_api_key = "${var.datadog_api_key}"
#     dd_app_key = "${var.datadog_app_key}"
# }

# module "monitor_mcnulty_events" {
#     source = "./modules/monitor_app"
#     app_name = "mcnulty-events"
#     dd_api_key = "${var.datadog_api_key}"
#     dd_app_key = "${var.datadog_app_key}"
# }