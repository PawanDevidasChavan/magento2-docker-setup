FROM php:8.3-fpm

RUN apt-get update && apt-get install -y \
    libfreetype6-dev libjpeg62-turbo-dev libpng-dev \
    libzip-dev zip unzip git curl libonig-dev \
    libxml2-dev libssl-dev libicu-dev libxslt1-dev \
    default-mysql-client gnupg2 vim cron sudo \
    && docker-php-ext-install pdo pdo_mysql zip intl xsl soap bcmath opcache sockets

RUN pecl install redis && docker-php-ext-enable redis

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN groupadd -g 1000 clp && useradd -u 1000 -g clp -m test-ssh

WORKDIR /var/www/html
