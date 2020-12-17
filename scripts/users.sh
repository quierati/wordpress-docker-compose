#!/bin/bash

docker-compose run --rm wpcli wp user create $USER_USER_WP $USER_EMAIL_WP --role=editor --user_pass=$USER_PASS_WP
