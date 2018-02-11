FROM php:7.0-fpm
RUN buildDeps="libpq-dev libzip-dev libfreetype6-dev libjpeg62-turbo-dev libpng12-dev " \
    && apt-get update \
    && apt-get install -y $buildDeps --no-install-recommends && \
    && apt-get install -y \
        libmcrypt-dev \
	libpng-dev \
	libmemcached-dev \
	libvarnishapi-dev \
	zlib1g-dev \
	libcurl4-openssl-dev \
	pkg-config \
	libpq-dev \
	libssl-dev \
	libpcre3-dev \
    && docker-php-ext-install -j$(nproc) iconv mcrypt \
    && pecl install redis-3.1.0 \
    && pecl install mongodb \
    && pecl install varnish-1.2.2 

RUN docker-php-ext-enable redis \
    && docker-php-ext-enable mongodb \
    && docker-php-ext-enable oauth \
    && docker-php-ext-install pdo \
    && docker-php-ext-install pdo_pgsql \
    && docker-php-ext-install pgsql \
    && docker-php-ext-install gd \
    && docker-php-ext-enable pdo \
    && docker-php-ext-enable pdo_pgsql \
    && docker-php-ext-enable pgsql \
    && docker-php-ext-enable gd \
    && docker-php-ext-install pdo_mysql 
    
