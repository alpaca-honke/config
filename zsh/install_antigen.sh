#!/usr/bin/env sh
if [ -f ~/antigen.zsh ] ;then
	echo "antigen has been installed."
else
	echo Start to install antigen...
	curl -sL git.io/antigen > ~/antigen.zsh
fi
