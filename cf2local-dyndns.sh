#!/usr/bin/env bash
source config

TYPE="A"
CONTENT="$(curl -s http://bot.whatismyipaddress.com)"
TTL="120"

RESPONSE=$(curl -s -X PUT "https://api.cloudflare.com/client/v4/zones/$ZONE_ID/dns_records/$DNS_ID" \
  -H "X-Auth-Email: $EMAIL" \
  -H "X-Auth-Key: $KEY" \
  -H "Content-Type: application/json" \
  --data '{"type":"'"$TYPE"'","name":"'"$NAME"'","content":"'"$CONTENT"'","proxied":false,"ttl":'"$TTL"'}')

echo $RESPONSE | python -m json.tool
