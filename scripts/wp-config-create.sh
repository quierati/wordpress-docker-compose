#!/bin/bash

if [ -e .env ]; then
. .env
fi


docker-compose run wpcli wp --allow-root config create --dbname=${DB_NAME} --dbuser=${DB_USER:-"root"} --dbpass=${DB_ROOT_PASSWORD} --extra-php <<EOF > wp-config.php
        /* begin wordpress config extra */

        /* AWS Cloudfront */
        if (null !== $$_SERVER['HTTP_CLOUDFRONT_FORWARDED_PROTO'] && $$_SERVER['HTTP_CLOUDFRONT_FORWARDED_PROTO'] === 'https') {
            $$_SERVER['HTTPS'] = 'on';
        }

        /* Multisite */
        if (getenv("MULTISITE")) {
           define( 'WP_ALLOW_MULTISITE', true );
           define( 'MULTISITE', true );
           define( 'SUBDOMAIN_INSTALL', false );
           define( 'DOMAIN_CURRENT_SITE', getenv("DOMAIN_CURRENT_SITE") );
           define( 'PATH_CURRENT_SITE', '/' );
           define( 'SITE_ID_CURRENT_SITE', 1 );
           define( 'BLOG_ID_CURRENT_SITE', 1 );
        }

        define( 'FORCE_SSL_ADMIN', true );

        define( 'WP_CACHE', getenv("WP_CACHE") );
        define( 'WP_SITEURL', 'https://' . $$_SERVER['HTTP_HOST'] );
        define( 'WP_HOME', 'https://' . $$_SERVER['HTTP_HOST'] );

        /* SES */
        define( 'WPOSES_AWS_ACCESS_KEY_ID', getenv("WPOSES_AWS_ACCESS_KEY_ID") );
        define( 'WPOSES_AWS_SECRET_ACCESS_KEY', getenv("WPOSES_AWS_SECRET_ACCESS_KEY") );

        /* end wordpress condig extra */
EOF
