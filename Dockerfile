FROM php:8-apache  
RUN set -ex && docker-php-ext-install pdo pdo_mysql
EXPOSE 80
CMD apache2-foreground
ENTRYPOINT [ "docker-php-entrypoint" ]

COPY ./src/ /var/www/html/
RUN set -ex && chown -R www-data:www-data /var/www/html/
USER www-data
