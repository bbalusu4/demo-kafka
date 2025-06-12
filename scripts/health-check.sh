#!/bin/bash
# Basic health check for Kafka and Kafka UI

echo "Checking Docker containers status..."
docker ps --filter "name=broker" --filter "name=kafka-ui"

echo -e "\nChecking Kafka broker connectivity on localhost:9092..."
# This command attempts to list topics, which requires a working broker
docker exec broker kafka-topics.sh --list --bootstrap-server localhost:9092 > /dev/null 2>&1
if [ $? -eq 0 ]; then
  echo "Kafka broker is reachable and responsive."
else
  echo "Kafka broker is NOT reachable. Check 'docker compose logs'."
fi

echo -e "\nChecking Kafka UI connectivity on http://localhost:8080..."
# Check if the port is listening
if nc -z localhost 8080; then
  echo "Kafka UI port 8080 is open. Try navigating to http://localhost:8080 in your browser."
else
  echo "Kafka UI port 8080 is NOT open. Check 'docker compose logs'."
fi