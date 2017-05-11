FROM php:7.0-fpm
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
	libmemcached-dev \
	zlib1g-dev \ 
    && docker-php-ext-install -j$(nproc) iconv mcrypt \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && pecl install redis-3.1.0 \
    && pecl install mongodb \
    && pecl install memcached-2.2.0 \
    && docker-php-ext-enable redis \
    && docker-php-ext-enable mongodb \
    && docker-php-ext-enable memcached \
    && docker-php-source delete
