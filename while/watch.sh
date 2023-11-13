#!/bin/bash

while :; do
  mv -f b.json a.json
  curl -s "https://cash.rbc.ru/cash/json/cash_rates_with_volumes/?city=1&currency=3&_=$(date +%s)000" \
    | jq --indent 0 '.banks[] | [ .name, .id, .rate.volume_id, .rate.sell ]' \
    | sort > b.json
  date
  diff -u --color a.json b.json
  sleep 60
done

