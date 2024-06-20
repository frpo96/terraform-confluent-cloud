module "public_myapp_payload_update" {
  source = "../modules/kafka_topic"

  common_vars = var.common_vars

  topic_name       = "public_myapp_payload_update"
  partitions_count = 6
  schema_file_path = "./schemas/avro/caja.avsc"
}

module "public_myapp_payload_update-tag-binding" {
  source = "../modules/kafka_topic_tag_binding"

  common_vars = var.common_vars

  topic_name       = module.this.kafka_topic_name
  tag_name         = "FINANCE"
}
