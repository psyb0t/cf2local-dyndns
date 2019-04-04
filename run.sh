#!/usr/bin/env bash
while true; do
  ./$(dirname $0)/cf2local-dyndns.sh
  sleep 60
done
