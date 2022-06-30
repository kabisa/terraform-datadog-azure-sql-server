variable "workers_percentage_enabled" {
  type    = bool
  default = true
}

variable "workers_percentage_warning" {
  type    = number
  default = null
}

variable "workers_percentage_critical" {
  type    = number
  default = 90.0
}

variable "workers_percentage_evaluation_period" {
  type    = string
  default = "last_30m"
}

variable "workers_percentage_note" {
  type    = string
  default = ""
}

variable "workers_percentage_docs" {
  type    = string
  default = ""
}

variable "workers_percentage_filter_override" {
  type    = string
  default = ""
}

variable "workers_percentage_alerting_enabled" {
  type    = bool
  default = true
}

variable "workers_percentage_no_data_timeframe" {
  type    = number
  default = null
}

variable "workers_percentage_notify_no_data" {
  type    = bool
  default = false
}

variable "workers_percentage_ok_threshold" {
  type    = number
  default = null
}

variable "workers_percentage_name_prefix" {
  type    = string
  default = ""
}

variable "workers_percentage_name_suffix" {
  type    = string
  default = ""
}

variable "workers_percentage_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = 3
}

variable "workers_percentage_notification_channel_override" {
  type    = string
  default = ""
}
