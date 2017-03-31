#!/bin/zsh

e="error :"
case $1 in
	conf|[cC])
		echo $e $conf
		echo "url : https://medium.com/me/applications"
	;;
	token|[tT])
		echo $e $token
		if [ -f $token ];then
			cat $token | jq .
		fi
	;;
	post|[pP])
		echo "no upload!"
	;;
esac
