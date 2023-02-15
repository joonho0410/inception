FROM debian:stable

RUN apt-get update && apt-get upgrade -y
RUN apt install mariadb-client \
	php \
	php-fpm \
	php-curl \
	php-gd \
	php-mbstring \
	php-mysql \
	php-zip \
	php-json \
	php-xml \
	php-xmlrpc \
	php-soap \
	php-intl \
	curl \
	vim \
	systemd -y
 
WORKDIR /var/www/html/
RUN curl -o latest.tar.gz https://wordpress.org/latest.tar.gz && tar -xvf latest.tar.gz
RUN chown -R www-data:www-data /var/www/html/wordpress
WORKDIR /var/www/html/wordpress
COPY ./tools/www.conf /etc/php/7.4/fpm/pool.d/www.conf
RUN mkdir -p /var/run/php
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY ./tools/script.sh /var/www/
RUN chmod 777 /var/www/script.sh
COPY ./tools/wp-config.php /var/www/
ENTRYPOINT ["/bin/sh" , "/var/www/script.sh"]
CMD ["/usr/sbin/php-fpm7.4" , "--nodaemonize"]
