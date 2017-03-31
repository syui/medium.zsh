#!/bin/zsh

# url=https://api.medium.com/v1/me/stories/pulbic
# https://github.com/Medium/medium-api-docs/issues/30

if [ ! -f $muser ];then
	$scpt/api-me.zsh
fi

user_name=`cat $json/user.json|jq -r .data.username`
#user_id=`cat $json/user.json|jq -r .data.id`
#author_id=`cat $muser | jq -r .data.id`
#access=`cat $token | jq -r .access_token`

# feed
# https://medium.com/feed/@${user_name}

url=https://medium.com/@${user_name}/latest
curl -sL -H "Authorization: Bearer $access" -H "Accept: application/json" $url |cut -d '>' -f 2| jq .

