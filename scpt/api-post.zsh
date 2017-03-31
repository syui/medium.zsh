#!/bin/zsh

if [ ! -f $muser ];then
	$scpt/api-me.zsh
fi

author_id=`cat $muser | jq -r .data.id`
access=`cat $token | jq -r .access_token`
url=https://api.medium.com/v1/users/$author_id/posts

body_sample='
	{
	  "title": "Liverpool FC",
	  "contentFormat": "html",
	  "content": "<h1>Liverpool FC</h1><p>You’ll never walk alone.</p>",
	  "canonicalUrl": "http://jamietalbot.com/posts/liverpool-fc",
	  "tags": ["football", "sport", "Liverpool"],
	  "publishStatus": "public"
	}
'

f=$l/`cat $conf|jq -r .body`
if [ -f $conf ] && [ -n "`cat $conf|jq -r .body`" ] && cat $f | jq . > /dev/null 2>&1;then
	body=`cat $f`
else
	body=$body_sample
fi

echo $body | jq .
echo $f
echo "upload? [yY]"
read key

case $key in
	[yY]|"")
		curl -sL \
			-H "Authorization: Bearer $access" \
			-H "Content-type: application/json" \
			-X POST -d "$body" \
			$url
	;;
	*)
		$error post
	;;
esac

