locals {
  connection_failed_filter = coalesce(
    var.connection_failed_filter_override,
    var.filter_str
  )
}

module "connection_failed" {
  source  = "kabisa/generic-monitor/datadog"
  version = "0.7.5"

  name  = "Connection failed"
  query = "sum(${var.connection_failed_evaluation_period}):sum:azure.sql_servers_databases.connection_failed{${local.connection_failed_filter}} by {subscription_name,server_name}.as_count() > ${var.connection_failed_critical}"

  # alert specific configuration
  require_full_window = true
  alert_message       = "More than {{threshold}} connections have failed over the past 30 minutes."
  recovery_message    = "Connection failed alert has recovered."

  # monitor level vars
  enabled              = var.connection_failed_enabled
  alerting_enabled     = var.connection_failed_alerting_enabled
  warning_threshold    = var.connection_failed_warning
  critical_threshold   = var.connection_failed_critical
  priority             = min(var.connection_failed_priority + var.priority_offset, 5)
  docs                 = var.connection_failed_docs
  note                 = var.connection_failed_note
  notification_channel = try(coalesce(var.connection_failed_notification_channel_override, var.notification_channel), "")

  # module level vars
  env                  = var.env
  service              = var.service
  service_display_name = var.service_display_name
  additional_tags      = var.additional_tags
  locked               = var.locked
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix
}
