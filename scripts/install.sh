#!/bin/bash

docker-compose run --rm wpcli wp core install --url=${WP_SITE_URL} --title="${WP_SITE_TITLE:-Wordpress}" --admin_user=${WP_ADMIN_USER:-admin} --admin_email=${WP_ADMIN_MAIL:-admin@localhost} --admin_password=${WP_ADMIN_PASS:-admin123} --skip-email
