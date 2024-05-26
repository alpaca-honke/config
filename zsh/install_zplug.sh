#!/usr/bin/env sh
if [ -d ~/.zplug ] ;then
	echo "zplug has been installed."
else
	echo Start to install zplug...
	curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh
fi
