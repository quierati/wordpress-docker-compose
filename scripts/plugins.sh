#!/bin/bash

docker-compose run --rm wpcli wp plugin install ${PLUGIN} --activate
