#!/bin/bash
while read -r LINE; do
  if [[ $LINE == *'='* ]] && [[ $LINE != '#'* ]]; then
    ENV_VAR="$(echo $LINE | envsubst)"
    eval "export $ENV_VAR"
  fi
done < .env
echo $SERVER_NAME
envsubst < nginx.conf.template > nginx.conf
