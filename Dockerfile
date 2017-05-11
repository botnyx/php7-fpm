FROM php:7.0-fpm
RUN apt-get update && apt-get install -y \
        libmcrypt-dev \
	libmemcached-dev \
	zlib1g-dev \
	libcurl4-openssl-dev \
	pkg-config \
	libssl-dev \
	libpcre3-dev \
    && docker-php-ext-install -j$(nproc) iconv mcrypt \
    && pecl install redis-3.1.0 \
    && pecl install mongodb \
    && pecl install couchbase-2.3.2 \
    && pecl install varnish-1.2.2 \
    && pecl install oauth-2.0.2 \
    && docker-php-ext-enable redis \
    && docker-php-ext-enable mongodb \
    && docker-php-ext-enable couchbase \
    && docker-php-ext-enable varnish \
    && docker-php-ext-enable oauth \
