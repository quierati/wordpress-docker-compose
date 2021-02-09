#!/bin/bash

USERNAME=$1
PASSWORD=$2
EMAIL=${3:-$USERNAME}
ROLE=${4:-"editor"}

docker-compose run --rm wpcli wp --allow-root user create $USERNAME $EMAIL --user_pass=$PASSWORD --role=$ROLE
