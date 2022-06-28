variable "log_io_percent_enabled" {
  type    = bool
  default = true
}

variable "log_io_percent_warning" {
  type    = number
  default = null
}

variable "log_io_percent_critical" {
  type    = number
  default = 90.0
}

variable "log_io_percent_evaluation_period" {
  type    = string
  default = "last_30m"
}

variable "log_io_percent_note" {
  type    = string
  default = ""
}

variable "log_io_percent_docs" {
  type    = string
  default = ""
}

variable "log_io_percent_filter_override" {
  type    = string
  default = ""
}

variable "log_io_percent_alerting_enabled" {
  type    = bool
  default = true
}

variable "log_io_percent_no_data_timeframe" {
  type    = number
  default = null
}

variable "log_io_percent_notify_no_data" {
  type    = bool
  default = false
}

variable "log_io_percent_ok_threshold" {
  type    = number
  default = null
}

variable "log_io_percent_name_prefix" {
  type    = string
  default = ""
}

variable "log_io_percent_name_suffix" {
  type    = string
  default = ""
}

variable "log_io_percent_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = 3
}

variable "log_io_percent_notification_channel_override" {
  type    = string
  default = ""
}
