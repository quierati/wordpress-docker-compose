#!/bin/bash
# WP Upgrade version
# 2021 Labunix

# get wp updates
docker-compose pull

# stop wp
docker-compose stop wp wpcli wpconfig

# remove wp
yes|docker container rm wordpress-docker-compose_wp_1 wordpress-docker-compose_wpconfig_1 wordpress-docker-compose_wpcli_1
yes|docker volume rm wordpress-docker-compose_wp-data

# recreate
docker-compose up -d --build

# stop
docker-compose stop wpconfig

# update all plugins
docker-compose run --rm wpcli wp plugin update --allow-root --all

exit 0
