# Dockerfile
FROM php:7-apache
MAINTAINER Dragan Marčeta <omladinacm@gmail.com>

COPY 000-default.conf /etc/apache2/sites-available/000-default.conf
COPY start-apache /usr/local/bin
#Enable mod_rewrite plugin for Apache
RUN a2enmod rewrite

# Copy application source
COPY src /var/www/
RUN chown -R www-data:www-data /var/www

CMD ["start-apache"]
