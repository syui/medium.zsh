#!/bin/zsh

if [ -f $conf ] ;then
	c=`cat $conf|jq -r '.client_id'`
	if [ -z "$c" ];then
		exit
	fi
fi

if [ ! -f $token ];then
	$error token
	exit
else
	key=`cat $token|jq -r 'keys|.[]'`
fi

if [ -n "`find $token -mtime -49 -ls`" ];then
	exit
fi

if [ "$key" != "errors" ];then
	ref=`cat $token|jq -r '.refresh_token'`
	id=`cat $conf|jq -r '.client_id'`
	sec=`cat $conf|jq -r '.client_secret'`
	curl -sL \
		-d refresh_token=$ref \
		-d client_id=$id \
		-d client_secret=$sec \
		-d grant_type=refresh_token \
		https://api.medium.com/v1/tokens >! $token
	cat $token | jq .
else
	$scpt/browser.zsh
fi
