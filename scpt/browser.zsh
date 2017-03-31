#!/bin/zsh

if [ -f $conf ] ;then
	c=`cat $conf|jq -r '.client_id'`
	if [ -z "$c" ];then
		$error conf
		exit
	fi
fi

if [ -f $token ];then
	key=`cat $token|jq -r 'keys|.[]'`
	if [ "$key" != "errors" ];then
		exit
	fi
else
	$error token
fi

if [ -f $conf ] && [ -n "$c" ];then
	id=`cat $conf|jq -r '.client_id'`
	s=`cat $conf|jq -r '.state'`
	sec=`cat $conf|jq -r '.client_secret'`
	r=`cat $conf|jq -r '.redirect_uri'`
	url="https://medium.com/m/oauth/authorize?client_id=$id&scope=basicProfile,publishPost,listPublications&state=$s&response_type=code&redirect_uri=$r"
else
	$error conf
	exit
fi

# . $scpt/browser-open.so
case $OSTYPE in
	darwin*)
		open -a Google\ Chrome $url
	;;
	linux*)
		chromium $url > /dev/null 2>&1 &
	;;
esac

echo enter
read key
code=`$scpt/browser-get-url.zsh`
code=${code##*=}
curl -sL \
	-d client_id=$id \
	-d client_secret=$sec \
	-d redirect_uri=$r \
	-d grant_type=authorization_code \
	-d code=$code \
	https://api.medium.com/v1/tokens >! $token
cat $token | jq .
