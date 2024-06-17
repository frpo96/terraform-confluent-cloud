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
