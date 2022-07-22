locals {
  deadlocks_filter = coalesce(
    var.deadlocks_filter_override,
    var.filter_str
  )
}

module "deadlocks" {
  source  = "kabisa/generic-monitor/datadog"
  version = "1.0.0"

  name  = "Deadlocks"
  query = "sum(${var.deadlocks_evaluation_period}):sum:azure.sql_servers_databases.deadlock{${local.deadlocks_filter}} by {subscription_name,server_name}.as_count() > ${var.deadlocks_critical}"

  # alert specific configuration
  require_full_window = true
  alert_message       = "{{value}} deadlocks have occurred over the past 5 minutes."
  recovery_message    = "Deadlocks alert has recovered."

  # monitor level vars
  enabled              = var.deadlocks_enabled
  alerting_enabled     = var.deadlocks_alerting_enabled
  warning_threshold    = var.deadlocks_warning
  critical_threshold   = var.deadlocks_critical
  priority             = min(var.deadlocks_priority + var.priority_offset, 5)
  docs                 = var.deadlocks_docs
  note                 = var.deadlocks_note
  notification_channel = try(coalesce(var.deadlocks_notification_channel_override, var.notification_channel), "")

  # module level vars
  env                  = var.env
  service              = var.service
  service_display_name = var.service_display_name
  additional_tags      = var.additional_tags
  locked               = var.locked
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix
}
