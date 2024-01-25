FROM php:7.4-apache

RUN apt-get update
RUN a2enmod rewrite 
RUN docker-php-ext-install mysqli

COPY config.php /var/www/html/
COPY register.html /var/www/html/
COPY register.php /var/www/html/

RUN chown -R www-data:www-data /var/www/html
 
EXPOSE 80

ENV DB_HOST=endpoint of database
ENV DB_USER=username of datbase
ENV DB_PASS=password of database
ENV DB_NAME=name of database

CMD ["apache2-foreground"]
