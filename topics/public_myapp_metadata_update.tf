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

  topic_name       = module.this.kafka_topic_name
  tag_name         = "FINANCE"
}
