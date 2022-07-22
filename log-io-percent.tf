locals {
  log_io_percent_filter = coalesce(
    var.log_io_percent_filter_override,
    var.filter_str
  )
}

module "log_io_percent" {
  source  = "kabisa/generic-monitor/datadog"
  version = "1.0.0"

  name  = "Log IO percent"
  query = "avg(${var.log_io_percent_evaluation_period}):avg:azure.sql_servers_databases.log_write_percent{${local.log_io_percent_filter}} by {subscription_name,server_name} > ${var.log_io_percent_critical}"

  # alert specific configuration
  require_full_window = true
  alert_message       = "Log IO percent has been above {{threshold}} over the last 30 minutes."
  recovery_message    = "Log IO percent alert has recovered."

  # monitor level vars
  enabled              = var.log_io_percent_enabled
  alerting_enabled     = var.log_io_percent_alerting_enabled
  warning_threshold    = var.log_io_percent_warning
  critical_threshold   = var.log_io_percent_critical
  priority             = min(var.log_io_percent_priority + var.priority_offset, 5)
  docs                 = var.log_io_percent_docs
  note                 = var.log_io_percent_note
  notification_channel = try(coalesce(var.log_io_percent_notification_channel_override, var.notification_channel), "")

  # module level vars
  env                  = var.env
  service              = var.service
  service_display_name = var.service_display_name
  additional_tags      = var.additional_tags
  locked               = var.locked
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix
}
