# Kafka Topic Module

This module creates a Kafka topic in Confluent Cloud.

## Inputs

- `confluent_cloud_api_key`: Confluent Cloud API Key
- `confluent_cloud_api_secret`: Confluent Cloud API Secret
- `kafka_cluster_id`: ID of the Kafka cluster
- `topic_name`: Name of the Kafka topic
- `rest_endpoint`: REST endpoint of the Kafka cluster
- `credentials_key`: API key for the Kafka cluster
- `credentials_secret`: API secret for the Kafka cluster

## Outputs

- `kafka_topic_name`: The name of the Kafka topic
