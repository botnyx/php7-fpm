FROM php:7.0-fpm
RUN buildDeps="libpq-dev libzip-dev libfreetype6-dev libjpeg62-turbo-dev libpng12-dev " && apt-get update && apt-get install -y \
        libmcrypt-dev \
	libpng-dev \
	libmemcached-dev \
	libvarnishapi-dev \
	zlib1g-dev \
	libcurl4-openssl-dev \
	pkg-config \
	libpq-dev \
	libssl-dev \
	libicu-dev \
	libpcre3-dev \
    && docker-php-ext-install -j$(nproc) iconv mcrypt \
    && pecl install redis-3.1.0 \
    && pecl install mongodb \
    && pecl install varnish-1.2.2 \
    && pecl install oauth-2.0.2 \
    && docker-php-ext-enable redis \
    && docker-php-ext-enable mongodb \
    && docker-php-ext-enable oauth \ 
    && docker-php-ext-install iconv json intl mysqli pdo pdo_pgsql pgsql gd pdo_mysql \
    && docker-php-ext-enable pdo_pgsql \
    && docker-php-ext-enable pgsql \
    && docker-php-ext-enable pdo \
    && docker-php-ext-enable gd \
    && docker-php-ext-enable pdo_mysql
    

    

