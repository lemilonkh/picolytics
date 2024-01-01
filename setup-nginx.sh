#!/bin/bash
while read -r LINE; do
  if [[ $LINE == *'='* ]] && [[ $LINE != '#'* ]]; then
    ENV_VAR="$(echo $LINE | envsubst)"
    eval "export $ENV_VAR"
  fi
done < .env
envsubst '$SERVER_NAME' < nginx.conf.template > nginx.conf

# docker-compose run --rm certbot certonly --webroot --webroot-path /var/www/certbot/ --dry-run -d $SERVER_NAME
