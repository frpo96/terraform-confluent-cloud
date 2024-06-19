resource "confluent_tag" "finance" {
  schema_registry_cluster {
    id = var.common_vars["schema_registry_cluster_id"]
  }
  rest_endpoint = var.common_vars["schema_registry_rest_endpoint"]
  credentials {
    key    = var.common_vars["schema_registry_api_key"]
    secret = var.common_vars["schema_registry_api_secret"]
  }

  name        = "FINANCE"
  description = "Finance-related data."

  lifecycle {
    prevent_destroy = false
  }
}