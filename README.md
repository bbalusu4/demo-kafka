# Local Kafka Demo Cluster

This repository provides a simple, self-contained Apache Kafka cluster setup using Docker Compose. It's designed for local development, testing, and demonstration purposes.
This repo uses KRAft mode for kafka cluster

## Prerequisites

* [Docker Desktop](https://www.docker.com/products/docker-desktop) (or Docker Engine for Linux) installed and running.(in my case i have podman running in my local)

## Getting Started
2.  **Start the Kafka Cluster:**
    This command will bring up the Kafka broker and Kafka UI.

    ```bash
    podman-compose -f docker-compose-kraft.yaml up -d
    ```
    *The first time you run this, Docker will download the necessary images, which might take a few minutes.*

3.  **Verify Cluster Status (Optional):**
    ```bash
    podman ps
    ```
    You should see `kafka`

**Using Helper Scripts (Recommended):**
**(PENDING) copy to the container**
* **Create a Topic:**
    ```bash
    ./scripts/create-topic.sh my-test-topic
    ```

* **Produce Messages:**
    ```bash
    ./scripts/produce-message.sh my-test-topic
    # Type your messages and press Enter after each. Press Ctrl+D to exit.
    ```

* **Consume Messages:**
    ```bash
    ./scripts/consume-message.sh my-test-topic
    ```

* **Health Check:**
    ```bash
    ./scripts/health-check.sh
    ```

**Manually (Requires local Kafka `bin` tools):**

If you have a local Kafka installation, you can directly use its `bin` utilities by pointing to `localhost:9092`:

```bash
# Example: Create a topic
/path/to/your/kafka/bin/kafka-topics.sh --create --topic another-topic --bootstrap-server localhost:9092 --partitions 1 --replication-factor 1

# Example: Produce
/path/to/your/kafka/bin/kafka-console-producer.sh --topic another-topic --bootstrap-server localhost:9092

# Example: Consume
/path/to/your/kafka/bin/kafka-console-consumer.sh --topic another-topic --bootstrap-server localhost:9092 --from-beginning