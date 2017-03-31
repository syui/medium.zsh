#!/bin/zsh

a=${0:a:h}/add
if [ -f $a ];then
	. $a
fi

$scpt/mkdir.zsh
$scpt/browser.zsh
$scpt/token.zsh

case $1 in
	me|[mM]|-[mM]|--[mM])
		$scpt/api-me.zsh
	;;
	post|[pP]|-[pP]|--[pP])
		$scpt/api-post.zsh
	;;
	list|[lL]|-[lL]|--[lL])
		$scpt/api-get-post.zsh
	;;
	help|[hH]|-[hH]|--[hH])
		cat $scpt/main.zsh
	;;
esac

