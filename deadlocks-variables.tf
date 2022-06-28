variable "deadlocks_enabled" {
  type    = bool
  default = true
}

variable "deadlocks_warning" {
  type    = number
  default = null
}

variable "deadlocks_critical" {
  type    = number
  default = 0.0
}

variable "deadlocks_evaluation_period" {
  type    = string
  default = "last_5m"
}

variable "deadlocks_note" {
  type    = string
  default = ""
}

variable "deadlocks_docs" {
  type    = string
  default = ""
}

variable "deadlocks_filter_override" {
  type    = string
  default = ""
}

variable "deadlocks_alerting_enabled" {
  type    = bool
  default = true
}

variable "deadlocks_no_data_timeframe" {
  type    = number
  default = null
}

variable "deadlocks_notify_no_data" {
  type    = bool
  default = false
}

variable "deadlocks_ok_threshold" {
  type    = number
  default = null
}

variable "deadlocks_name_prefix" {
  type    = string
  default = ""
}

variable "deadlocks_name_suffix" {
  type    = string
  default = ""
}

variable "deadlocks_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = 3
}

variable "deadlocks_notification_channel_override" {
  type    = string
  default = ""
}
