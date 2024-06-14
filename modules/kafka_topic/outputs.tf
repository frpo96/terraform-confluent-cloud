output "kafka_topic_name" {
  description = "The name of the Kafka topic"
  value       = confluent_kafka_topic.this.topic_name
}
