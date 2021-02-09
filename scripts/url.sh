#!/bin/bash

SITE=${1:-"http://localhost"}

docker-compose run --rm wpcli wp --allow-root config set WP_SITEURL ${SITE}
docker-compose run --rm wpcli wp --allow-root config set WP_HOME ${SITE}
