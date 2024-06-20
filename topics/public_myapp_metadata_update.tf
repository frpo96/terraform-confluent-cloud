module "this" {
  source = "../modules/kafka_topic"

  common_vars = var.common_vars

  topic_name       = "public_myapp_metadata_update"
  partitions_count = 6
  schema_file_path = "./schemas/avro/caja.avsc"
}
