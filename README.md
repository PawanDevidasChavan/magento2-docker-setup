# Magento 2 Dockerized Environment 

## Overview
This project provides a fully containerized Magento 2 setup using Docker Compose. It includes:
- Magento 2 (latest)
- PHP 8.3 (FPM)
- MySQL 8
- NGINX
- Redis
- Elasticsearch 8.x
- Varnish
- PHPMyAdmin

## 🛠️ Services
| Service       | URL Format                      |
|---------------|----------------------------------|
| Magento Frontend | http://<your-public-ip>       |
| Magento Admin | http://<your-public-ip>/admin   |
| PHPMyAdmin    | http://<your-public-ip>:8080    |

## 🧰 Usage Instructions
1. Clone this repo or copy files to your server.
2. Build and start the containers:
   ```bash
   docker-compose up -d --build
   ```
3. Access the PHP container:
   ```bash
   docker-compose exec php bash
   ```
4. Inside the container, install Magento:
   ```bash
   composer create-project --repository=https://repo.magento.com/ magento/project-community-edition .
   ```
5. Run setup (adjust base URL):
   ```bash
   bin/magento setup:install \
   --base-url=http://<your-public-ip> \
   --db-host=mysql \
   --db-name=magento \
   --db-user=root \
   --db-password=root \
   --backend-frontname=admin \
   --admin-firstname=Admin \
   --admin-lastname=User \
   --admin-email=admin@example.com \
   --admin-user=admin \
   --admin-password=Admin123 \
   --search-engine=elasticsearch7 \
   --elasticsearch-host=elasticsearch \
   --elasticsearch-port=9200 \
   --use-rewrites=1
   ```

## Credentials
- **Magento Admin**: `admin / Admin123`
- **MySQL Root**: `root / root`
- **PHPMyAdmin**: http://<your-public-ip>:8080

## Dockerized Stack
- Docker Compose orchestrates all services.
- All volumes are persisted.
- Services start with one command: `docker-compose up -d`


