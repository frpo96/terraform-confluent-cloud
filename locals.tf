locals {
  common_vars = {
    confluent_cloud_api_key          = var.confluent_cloud_api_key
    confluent_cloud_api_secret       = var.confluent_cloud_api_secret
    kafka_cluster_id                 = var.kafka_cluster_id
    rest_endpoint                    = var.rest_endpoint
    credentials_key                  = var.credentials_key
    credentials_secret               = var.credentials_secret
    schema_registry_api_key          = var.schema_registry_api_key
    schema_registry_api_secret       = var.schema_registry_api_secret
    schema_registry_cluster_id       = var.schema_registry_cluster_id
    schema_registry_rest_endpoint    = var.schema_registry_rest_endpoint
  }
}
