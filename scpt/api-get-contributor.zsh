#!/bin/zsh

if [ ! -f $muser ];then
	$scpt/api-me.zsh
fi

user_id=`cat $json/user.json|jq -r .data.id`
author_id=`cat $muser | jq -r .data.id`
access=`cat $token | jq -r .access_token`

url=https://api.medium.com/v1/publications/{{publicationId}}/contributors
curl -sL -H "Authorization: Bearer $access" $url
