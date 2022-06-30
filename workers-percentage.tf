locals {
  workers_percentage_filter = coalesce(
    var.workers_percentage_filter_override,
    var.filter_str
  )
}

module "workers_percentage" {
  source  = "kabisa/generic-monitor/datadog"
  version = "0.7.5"

  name  = "Workers percentage"
  query = "avg(${var.workers_percentage_evaluation_period}):avg:azure.sql_servers_databases.workers_percent{${local.workers_percentage_filter}} by {subscription_name,server_name} > ${var.workers_percentage_critical}"

  # alert specific configuration
  require_full_window = true
  alert_message       = "Workers have been busy above {{threshold}} over the last 30 minutes."
  recovery_message    = "Workers percentage alert has recovered."

  # monitor level vars
  enabled              = var.workers_percentage_enabled
  alerting_enabled     = var.workers_percentage_alerting_enabled
  warning_threshold    = var.workers_percentage_warning
  critical_threshold   = var.workers_percentage_critical
  priority             = min(var.workers_percentage_priority + var.priority_offset, 5)
  docs                 = var.workers_percentage_docs
  note                 = var.workers_percentage_note
  notification_channel = try(coalesce(var.workers_percentage_notification_channel_override, var.notification_channel), "")

  # module level vars
  env                  = var.env
  service              = var.service
  service_display_name = var.service_display_name
  additional_tags      = var.additional_tags
  locked               = var.locked
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix
}
