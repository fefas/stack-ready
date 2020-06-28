ARG VERSION
ARG OS

FROM php:$VERSION-fpm-$OS

ARG COMPOSER_VERSION
ARG OS_PACKS
ARG EXTS_INSTALL
ARG INSTALL_DIR=/usr/local/bin/

RUN apk add --no-cache $OS_PACKS && \
    docker-php-ext-install $EXTS_INSTALL && \
    curl -sS https://getcomposer.org/installer | \
        php -- \
        --version=$COMPOSER_VERSION \
        --install-dir=$INSTALL_DIR \
        --filename=composer

COPY ./bin/* $INSTALL_DIR
WORKDIR /var/www/
ENTRYPOINT ["entrypoint"]
