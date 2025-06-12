#!/bin/bash
# Usage: ./consume-message.sh <topic_name>

TOPIC_NAME=${1:-my-demo-topic} # Default topic name if not provided
BOOTSTRAP_SERVER="localhost:9092"

echo "Consuming messages from topic: $TOPIC_NAME (from beginning)"
docker exec broker kafka-console-consumer.sh \
  --topic "$TOPIC_NAME" \
  --bootstrap-server "$BOOTSTRAP_SERVER" \
  --from-beginning