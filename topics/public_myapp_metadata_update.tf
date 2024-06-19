module "this" {
  source = "../modules/kafka_topic"

  common_vars = var.common_vars

  topic_name       = "public_myapp_metadata_update"
  partitions_count = 6
  schema_file_path = "./schemas/avro/caja.avsc"
}

module "this-tag-binding" {
  source = "../modules/kafka_topic_tag_binding"

  common_vars = var.common_vars

  topic_name       = "public_myapp_metadata_update"
  tag_name         = "FINANCE"
}

/*resource "confluent_tag_binding" "finance-demo_pipeline_caja-tagging" {
  schema_registry_cluster {
    id = var.common_vars["schema_registry_cluster_id"]
  }
  rest_endpoint = var.common_vars["schema_registry_rest_endpoint"]
  credentials {
    key    = var.common_vars["schema_registry_api_key"]
    secret = var.common_vars["schema_registry_api_secret"]
  }

  tag_name     = "FINANCE"
  entity_name  = "${var.common_vars["schema_registry_cluster_id"]}:${var.common_vars["kafka_cluster_id"]}:${module.public_myapp_metadata_update.kafka_topic_name}"
  entity_type  = "kafka_topic"

  lifecycle {
    prevent_destroy = false
  }
}*/
