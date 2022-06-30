locals {
  dtu_percentage_filter = coalesce(
    var.dtu_percentage_filter_override,
    var.filter_str
  )
}

module "dtu_percentage" {
  source  = "kabisa/generic-monitor/datadog"
  version = "0.7.5"

  name  = "DTU Percentage"
  query = "avg(${var.dtu_percentage_evaluation_period}):avg:azure.sql_servers_databases.dtu_consumption_percent{${local.dtu_percentage_filter}} by {subscription_name,server_name} > ${var.dtu_percentage_critical}"

  # alert specific configuration
  require_full_window = true
  alert_message       = "The DTU usage percentage of {{server_name.name}} in {{subscription_name.name}} has risen above {{threshold}} for longer than 15 minutes"
  recovery_message    = "The DTU usage percentage of {{server_name.name}} in {{subscription_name.name}} has recovered"

  # monitor level vars
  enabled              = var.dtu_percentage_enabled
  alerting_enabled     = var.dtu_percentage_alerting_enabled
  warning_threshold    = var.dtu_percentage_warning
  critical_threshold   = var.dtu_percentage_critical
  priority             = min(var.dtu_percentage_priority + var.priority_offset, 5)
  docs                 = var.dtu_percentage_docs
  note                 = var.dtu_percentage_note
  notification_channel = try(coalesce(var.dtu_percentage_notification_channel_override, var.notification_channel), "")

  # module level vars
  env                  = var.env
  service              = var.service
  service_display_name = var.service_display_name
  additional_tags      = var.additional_tags
  locked               = var.locked
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix
}
