#!/bin/bash
# Usage: ./create-topic.sh <topic_name> [partitions] [replication_factor]

TOPIC_NAME=${1:-my-demo-topic} # Default topic name if not provided
PARTITIONS=${2:-1}
REPLICATION_FACTOR=${3:-1}
BOOTSTRAP_SERVER="localhost:9092"

echo "Creating Kafka topic: $TOPIC_NAME with $PARTITIONS partitions and replication factor of $REPLICATION_FACTOR..."
docker exec broker kafka-topics.sh \
  --create \
  --topic "$TOPIC_NAME" \
  --bootstrap-server "$BOOTSTRAP_SERVER" \
  --partitions "$PARTITIONS" \
  --replication-factor "$REPLICATION_FACTOR" \
  --if-not-exists

if [ $? -eq 0 ]; then
  echo "Topic '$TOPIC_NAME' created successfully (or already exists)."
else
  echo "Failed to create topic '$TOPIC_NAME'."
fi