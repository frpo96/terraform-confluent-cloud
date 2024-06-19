resource "confluent_tag" "pii" {
  schema_registry_cluster {
    id = var.common_vars["schema_registry_cluster_id"]
  }
  rest_endpoint = var.common_vars["schema_registry_rest_endpoint"]
  credentials {
    key    = var.common_vars["schema_registry_api_key"]
    secret = var.common_vars["schema_registry_api_secret"]
  }

  name        = "PII"
  description = "Personally identifiable information"

  lifecycle {
    prevent_destroy = false
  }
}

resource "confluent_tag_binding" "pii-topic-tagging" {
  schema_registry_cluster {
    id = var.common_vars["schema_registry_cluster_id"]
  }
  rest_endpoint = var.common_vars["schema_registry_rest_endpoint"]
  credentials {
    key    = var.common_vars["schema_registry_api_key"]
    secret = var.common_vars["schema_registry_api_secret"]
  }

  tag_name     = confluent_tag.pii.name
  entity_name  = "${var.common_vars["schema_registry_cluster_id"]}:${var.common_vars["kafka_cluster_id"]}:demo-pipeline-caja"
  entity_type  = "kafka_topic"

  lifecycle {
    prevent_destroy = false
  }
}

module "demo_pipeline_caja" {
  source = "./kafka_topic"

  common_vars = var.common_vars

  topic_name       = "demo-pipeline-caja"
  partitions_count = 6
  schema_file_path = "./schemas/avro/caja.avsc"
}
