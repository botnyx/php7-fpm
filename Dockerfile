FROM php:7.0-fpm
RUN apt-get update && apt-get install -y \
        libmcrypt-dev \
	zlib1g-dev \
	libcurl4-openssl-dev \
	pkg-config \
	libssl-dev \
    && docker-php-ext-install -j$(nproc) iconv mcrypt \
    && pecl install redis-3.1.0 \
    && pecl install mongodb \
    && docker-php-ext-enable redis \
    && docker-php-ext-enable mongodb \
    
