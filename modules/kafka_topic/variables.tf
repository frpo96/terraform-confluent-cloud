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

variable "partitions_count" {
  description = "The number of partitions for the Kafka topic"
  type        = number
  default     = 1  # You can set a default value if needed
}

variable "schema_file_path" {
  description = "The file path to the AVRO schema."
  type        = string
}
