locals {
  storage_percentage_filter = coalesce(
    var.storage_percentage_filter_override,
    var.filter_str
  )
}

module "storage_percentage" {
  source  = "kabisa/generic-monitor/datadog"
  version = "1.0.0"

  name  = "Storage percentage"
  query = "max(${var.storage_percentage_evaluation_period}):avg:azure.sql_servers_databases.storage_percent{${local.storage_percentage_filter}} by {subscription_name,server_name} > ${var.storage_percentage_critical}"

  # alert specific configuration
  require_full_window = true
  alert_message       = "Storage percentage above {{threshold}}."
  recovery_message    = "Storage percentage alert has recovered."

  # monitor level vars
  enabled              = var.storage_percentage_enabled
  alerting_enabled     = var.storage_percentage_alerting_enabled
  warning_threshold    = var.storage_percentage_warning
  critical_threshold   = var.storage_percentage_critical
  priority             = min(var.storage_percentage_priority + var.priority_offset, 5)
  docs                 = var.storage_percentage_docs
  note                 = var.storage_percentage_note
  notification_channel = try(coalesce(var.storage_percentage_notification_channel_override, var.notification_channel), "")

  # module level vars
  env                  = var.env
  service              = var.service
  service_display_name = var.service_display_name
  additional_tags      = var.additional_tags
  locked               = var.locked
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix
}
