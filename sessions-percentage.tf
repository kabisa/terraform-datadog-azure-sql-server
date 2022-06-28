locals {
  sessions_percentage_filter = coalesce(
    var.sessions_percentage_filter_override,
    var.filter_str
  )
}

module "sessions_percentage" {
  source  = "kabisa/generic-monitor/datadog"
  version = "0.7.1"

  name  = "Sessions percentage"
  query = "avg(${var.sessions_percentage_evaluation_period}):avg:azure.sql_servers_databases.sessions_percent{${local.sessions_percentage_filter}} by {subscription_name,server_name} > ${var.sessions_percentage_critical}"

  # alert specific configuration
  require_full_window = true
  alert_message       = "Server sessions have been above {{threshold}} over the last 30 minutes."
  recovery_message    = "Server sessions alert has recovered."

  # monitor level vars
  enabled              = var.sessions_percentage_enabled
  alerting_enabled     = var.sessions_percentage_alerting_enabled
  warning_threshold    = var.sessions_percentage_warning
  critical_threshold   = var.sessions_percentage_critical
  priority             = min(var.sessions_percentage_priority + var.priority_offset, 5)
  docs                 = var.sessions_percentage_docs
  note                 = var.sessions_percentage_note
  notification_channel = try(coalesce(var.sessions_percentage_notification_channel_override, var.notification_channel), "")

  # module level vars
  env                  = var.env
  service              = var.service
  service_display_name = var.service_display_name
  additional_tags      = var.additional_tags
  locked               = var.locked
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix
}
