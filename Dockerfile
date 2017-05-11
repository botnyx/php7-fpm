FROM php:7.0-fpm
RUN apt-get update && apt-get install -y \
        libmcrypt-dev \
	zlib1g-dev \ 
	php-mongo \
    && docker-php-ext-install -j$(nproc) iconv mcrypt \
    && pecl install redis-3.1.0 \
    && docker-php-ext-enable redis 
