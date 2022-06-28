variable "connection_failed_enabled" {
  type    = bool
  default = true
}

variable "connection_failed_warning" {
  type    = number
  default = null
}

variable "connection_failed_critical" {
  type    = number
  default = 10.0
}

variable "connection_failed_evaluation_period" {
  type    = string
  default = "last_30m"
}

variable "connection_failed_note" {
  type    = string
  default = ""
}

variable "connection_failed_docs" {
  type    = string
  default = ""
}

variable "connection_failed_filter_override" {
  type    = string
  default = ""
}

variable "connection_failed_alerting_enabled" {
  type    = bool
  default = true
}

variable "connection_failed_no_data_timeframe" {
  type    = number
  default = null
}

variable "connection_failed_notify_no_data" {
  type    = bool
  default = false
}

variable "connection_failed_ok_threshold" {
  type    = number
  default = null
}

variable "connection_failed_name_prefix" {
  type    = string
  default = ""
}

variable "connection_failed_name_suffix" {
  type    = string
  default = ""
}

variable "connection_failed_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = 3
}

variable "connection_failed_notification_channel_override" {
  type    = string
  default = ""
}
