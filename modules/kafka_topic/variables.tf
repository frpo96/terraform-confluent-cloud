variable "confluent_cloud_api_key" {
  description = "Confluent Cloud API Key"
  type        = string
}

variable "confluent_cloud_api_secret" {
  description = "Confluent Cloud API Secret"
  type        = string
}

variable "kafka_cluster_id" {
  description = "ID of the Kafka cluster"
  type        = string
}

variable "topic_name" {
  description = "Name of the Kafka topic"
  type        = string
}

variable "partitions_count" {
  description = "The number of partitions for the Kafka topic"
  type        = number
  default     = 1  # You can set a default value if needed
}

variable "rest_endpoint" {
  description = "REST endpoint of the Kafka cluster"
  type        = string
}

variable "credentials_key" {
  description = "API key for the Kafka cluster"
  type        = string
}

variable "credentials_secret" {
  description = "API secret for the Kafka cluster"
  type        = string
}

variable "schema_registry_cluster_id" {
  description = "The ID of the schema registry cluster."
  type        = string
}

variable "schema_registry_rest_endpoint" {
  description = "The REST endpoint of the schema registry."
  type        = string
}

variable "schema_registry_api_key" {
  description = "The REST endpoint of the schema registry."
  type        = string
}

variable "schema_registry_api_secret" {
  description = "The REST endpoint of the schema registry."
  type        = string
}

variable "schema_file_path" {
  description = "The file path to the AVRO schema."
  type        = string
}
