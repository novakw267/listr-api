#!/bin/bash

API="http://localhost:4741"
URL_PATH="/store/create"
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "info": {
      "name": "'"{$NAME}"'"
    }
  }'

echo
