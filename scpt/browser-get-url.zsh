#!/bin/zsh

case $OSTYPE in
	darwin*)
		osascript -e 'tell application "Google Chrome" to get URL of active tab of first window'
	;;
	linux*)
		url=`strings ~/.config/chromium/Default/Current\ Tabs | grep http | head -n 1`
		echo $url
	;;
esac

