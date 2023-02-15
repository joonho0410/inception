#!bin/bash
#cd /var/www/html
#curl -o latest.tar.gz https://wordpress.org/latest.tar.gz && tar -xvf latest.tar.gz
#chown -R www-data:www-data /var/www/html
mv /var/www/wp-config.php /var/www/html/wordpress/
/usr/local/bin/wp core install --allow-root --path=/var/www/html/wordpress --url="junhjeon.42.fr" --title="test" --admin_user="$WORDPRESS_AD_NAME" --admin_password="$WORDPRESS_AD_PASS" --admin_email="$WORDPRESS_AD_MAIL"
/usr/local/bin/wp user create "$WORDPRESS_US_NAME" "$WORDPRESS_US_MAIL" --user_pass="$WORDPRESS_US_PASS" --allow-root --path=/var/www/html/wordpress
exec "$@"

