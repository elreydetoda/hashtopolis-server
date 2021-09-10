FROM php:8-apache  
RUN set -ex && docker-php-ext-install pdo pdo_mysql
RUN set -ex && install <(curl -fsSLo - "$(curl -sLI -o /dev/null -w '%{url_effective}' "https://github.com/tianon/gosu/releases/latest" | sed 's/tag/download/')/gosu-amd64") /usr/local/bin/gosu && gosu --version
EXPOSE 80
CMD apache2-foreground
ENTRYPOINT [ "docker-entrypoint.sh" ]

COPY docker-entrypoint.sh /usr/local/bin/
COPY --chown=www-data:www-data ./src/ /var/www/html/
