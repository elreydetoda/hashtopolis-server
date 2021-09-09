FROM php:8-apache
COPY ./src/* /var/www/html/
RUN set -ex && docker-php-ext-install pdo pdo_mysql
RUN set -ex && chown -R www-data:www-data /var/www/html/
USER www-data
EXPOSE 80
CMD apache2-foreground
ENTRYPOINT [ "docker-php-entrypoint" ]
