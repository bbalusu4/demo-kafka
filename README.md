# Local Kafka Demo Cluster

This repository provides a simple, self-contained Apache Kafka cluster setup using Docker Compose. It's designed for local development, testing, and demonstration purposes.

## Prerequisites

* [Docker Desktop](https://www.docker.com/products/docker-desktop) (or Docker Engine for Linux) installed and running.

## Getting Started

1.  **Clone the Repository:**
    ```bash
    git clone [https://github.com/your-username/kafka-local-demo.git](https://github.com/your-username/kafka-local-demo.git)
    cd kafka-local-demo
    ```

2.  **Start the Kafka Cluster:**
    This command will bring up the Kafka broker and Kafka UI.

    ```bash
    docker compose up -d
    ```
    *The first time you run this, Docker will download the necessary images, which might take a few minutes.*

3.  **Verify Cluster Status (Optional):**
    ```bash
    docker ps
    ```
    You should see `broker` and `kafka-ui` containers running.

4.  **Access Kafka UI:**
    Open your web browser and go to: [http://localhost:8080](http://localhost:8080)
    You should see the `local-kafka` cluster pre-configured.

## Interacting with Kafka

You can use the provided helper scripts or Kafka's `bin` utilities (if you have them installed locally) to interact with the cluster.

**Using Helper Scripts (Recommended):**

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
# /path/to/your/kafka/bin/kafka-console-consumer.sh --topic another-topic --bootstrap-server localhost:9092 --from-beginning