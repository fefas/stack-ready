ARG VERSION
ARG OS
ARG OS_VERSION

FROM php:$VERSION-fpm-$OS$OS_VERSION

ENV USER www-data
ENV WORK_DIR /var/www
ARG DEP_MANAGER_VERSION
ARG INSTALLS

COPY ./setup/ /root/setup/
COPY ./bin/* /usr/local/bin/

RUN cd /root && \
    ./setup/common && \
    ./setup/php/setup && \
    rm -rf /root/setup

WORKDIR $WORK_DIR
USER www-data

ENTRYPOINT ["entrypoint"]
