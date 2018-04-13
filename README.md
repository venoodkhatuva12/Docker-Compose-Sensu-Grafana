# Sensu &amp; Grafana in Docker

#### Docker implementation of Sensu & Grafana, using secure SSL communication between client nodes and RabbitMQ.

## Installation Guide
1. Run ./setup_ssl.sh generate
2. docker-compose up -d

If you're trying to run this within a secure network, you will need to pull down the images, export them from your workstation, and import them on the network. Please see documentation below:
https://docs.docker.com/engine/reference/commandline/save/
https://docs.docker.com/engine/reference/commandline/load/

## Defaults

### Login Information


#### RabbitMQ
**Note:** When changing RabbitMQ configurations, you'll want to make sure that the configuration for sensu (rabbitmq.json) reflects the changes made.
- VHost: /sensu
- Username: sensu
- Password: sensu

#### Graphite
- Username: admin
- Password: admin

#### Grafana
- Username: admin
- Password: admin

### Ports:

| Service                | Port  |
| ---------------------- | ----- |
| Uchiwa Web Dashboard   | 3000  |
| Grafana Web Dashboard  | 3030  |
| Graphite Data UI       | 8080  |

### Volumes

Volumes all use paths relative to the docker-compose.yml file.

The log directories mapped to the host will fill up very quickly, so it is advised that these are managed under log rotation.

| Container | Purpose                 | Host Directory                       | Container Directory               |
|-----------|-------------------------|--------------------------------------|-----------------------------------|
| Redis     | RDB store directory     | ./volumes/redis/lib                  | /var/lib/redis                    |
| RabbitMQ  | Configuration file      | ./volumes/rabbitmq/rabbit.config     | /etc/rabbitmq/rabbit.config       |
| RabbitMQ  | Env configuration file  | ./volumes/rabbitmq/rabbitmq-env.conf | /etc/rabbitmq/rabbitmq-env.conf   |
| RabbitMQ  | Log directory           | ./volumes/rabbitmq/logs              | /var/log/rabbitmq                 |
| RabbitMQ  | Server SSL directory    | ./volumes/ssl/server                 | /etc/rabbitmq/ssl                 |
| Server    | Configuration directory | ./volumes/server/conf.d              | /etc/sensu/conf.d                 |
| Server    | Log directory           | ./volumes/server/logs                | /var/log/sensu                    |
| Server    | Client SSL directory    | ./volumes/ssl/client                 | /etc/sensu/ssl                    |
| Uchiwa    | Configuration file      | ./volumes/uchiwa/config.json         | /config/config.json               |
| Graphite  | Data directory          | ./volumes/graphite                   | /var/lib/graphite/storage/whisper |
| Grafana   | Plugins                 | ./volumes/grafana                    | /var/lib/grafana/                 |
| Grafana   | Log directory           | ./volumes/grafana/logs               | /var/log/grafana                  |
| Grafana DB| DB directory            | ./volumes/grafana/mysql              | /var/lib/mysql                    |



