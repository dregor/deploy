FROM php:7.1-fpm
RUN apt-get update \
    && apt-get install -y \
        libpng-dev \
        libmcrypt-dev \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libbz2-dev \
        libcurl3-dev \
        libpng-dev \
        libedit-dev \
        libxml2-dev \ 
        libxslt1-dev \
        libmemcached-dev \
        zlib1g-dev \
    && docker-php-ext-install -j$(nproc) \
        bz2 \
        curl \
        gd \
        json \
        mbstring \
        mysqli \
        readline \
        soap \
        xml \
        xmlrpc \
        xsl \
        zip \
        pcntl \
        pdo \
        pdo_mysql \
    && pecl install xdebug memcached \
    && echo extension=memcached.so >> /usr/local/etc/php/conf.d/memcached.ini \
    && docker-php-ext-enable xdebug memcached \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /tmp/pear \
    && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php \
    && php -r "unlink('composer-setup.php');" \
    && mv /var/www/html/composer.phar /usr/local/bin/composer