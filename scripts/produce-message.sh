#!/bin/bash
# Usage: ./produce-message.sh <topic_name>

TOPIC_NAME=${1:-my-demo-topic} # Default topic name if not provided
BOOTSTRAP_SERVER="localhost:9092"

echo "Producing messages to topic: $TOPIC_NAME (Type messages, press Enter, then Ctrl+D to exit)"
docker exec -i broker kafka-console-producer.sh \
  --topic "$TOPIC_NAME" \
  --bootstrap-server "$BOOTSTRAP_SERVER"