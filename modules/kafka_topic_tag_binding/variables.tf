variable "common_vars" {
  description = "Common variables to be used across modules"
}

variable "topic_name" {
  description = "Name of the Kafka topic"
  type        = string
  validation {
    condition     = can(regex("^(private|public)\\_[a-zA-Z0-9_-]+\\_[a-zA-Z0-9_-]+\\_[a-zA-Z0-9_-]+$", var.topic_name))
    error_message = "Topic name should conform to <private|public>_<application>_<data-type>_<event-type>"
  }
}

variable "tag_name" {
  description = "Name of the tag"
  type        = string
}
