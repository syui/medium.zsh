#!/bin/zsh

url=https://api.medium.com/v1/me

access=`cat $token | jq -r .access_token`
curl -sL -H "Authorization: Bearer $access" $url >! $muser
cat $muser | jq .
