# Set up the prompt
#autoload -Uz promptinit
#promptinit
#prompt adam1

#source ~/.git-prompt.sh
#GIT_PS1_SHOWDIRTYSTATE="yes"
#GIT_PS1_SHOWSTASHSTATE="yes"
#GIT_PS1_SHOWUNTRACKEDFILES="yes"
#GIT_PS1_SHOWUPSTREAM="yes"
#precmd (){
#	if [ $? -eq 0 ] ;then
#		PROMPT=$'%B%F{12}zsh %n@%m '$(__git_ps1 " (%s)")$'%f\n%F{6}%~%f %F{3}%#%f%b '
#	else
#		PROMPT=$'%F{12}zsh %n@%m '$(__git_ps1 " (%s)")$'%f\n%F{6}%~%f %F{9}%#%f '
#	fi
#	if [ ${VIRTUAL_ENV:-} ] ;then
#		ENVNAME=${VIRTUAL_ENV##*/}
#		PROMPT="($ENVNAME) $PROMPT"
#	fi
#}

setopt histignorealldups sharehistory
# move without cd
setopt auto_cd

# Use emacs keybindings even if our EDITOR is set to vi; if you want to use vi keybindings, use "-v"
export EDITOR="vim"
bindkey -v
bindkey "jj" vi-cmd-mode

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'



#antigen
[ -s ~/antigen.zsh ] || curl -sL git.io/antigen > ~/antigen.zsh
source ~/antigen.zsh

antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle olets/zsh-abbr@main
antigen bundle rupa/z z.sh
antigen bundle alpaca-honke/prowpt@main

antigen apply

alias ls='ls -F --color=auto'
alias diff='diff --color=auto'
abbr -S ll='ls -l' >/dev/null
abbr -S la='ls -A' >/dev/null
abbr -S lla='ls -l -A' >/dev/null
abbr -S gst='git status' >/dev/null
abbr -S gsw='git switch' >/dev/null
abbr -S gbr='git branch' >/dev/null
abbr -S gfe='git fetch' >/dev/null
abbr -S gpl='git pull' >/dev/null
abbr -S gad='git add' >/dev/null
abbr -S gcm='git commit' >/dev/null
abbr -S gmg='git merge' >/dev/null
abbr -S gpsh='git push' >/dev/null

 # Show vi mode status line: https://www.zsh.org/mla/users/2002/msg00108.html
	#
	# Reads until the given character has been entered.
	#
	readuntil () {
		typeset a
		while [ "$a" != "$1" ]
		do
			read -E -k 1 a
		done
	}

	#
	# If the $SHOWMODE variable is set, displays the vi mode, specified by
	# the $VIMODE variable, under the current command line.
	# 
	# Arguments:
	#
	#   1 (optional): Beyond normal calculations, the number of additional
	#   lines to move down before printing the mode.  Defaults to zero.
	#
	showmode() {
		typeset movedown
		typeset row

		# Get number of lines down to print mode
		movedown=$(($(echo "$RBUFFER" | wc -l) + ${1:-0}))
		
		# Get current row position
		echo -n "\e[6n"
		row="${${$(readuntil R)#*\[}%;*}"
		
		# Are we at the bottom of the terminal?
		if [ $((row+movedown)) -gt "$LINES" ]
		then
			# Scroll terminal up one line
			echo -n "\e[1S"
			
			# Move cursor up one line
			echo -n "\e[1A"
		fi
		
		# Save cursor position
		echo -n "\e[s"
		
		# Move cursor to start of line $movedown lines down
		echo -n "\e[$movedown;E"
		
		# Change font attributes
		echo -n "\e[1m"
		
		# Has a mode been set?
		if [ -n "$VIMODE" ]
		then
			# Print mode line
			echo -n "-- $VIMODE -- "
		else
			# Clear mode line
			echo -n "\e[0K"
		fi

		# Restore font
		echo -n "\e[0m"
		
		# Restore cursor position
		echo -n "\e[u"
	}

	clearmode() {
		VIMODE= showmode
	}

	#
	# Temporary function to extend built-in widgets to display mode.
	#
	#   1: The name of the widget.
	#
	#   2: The mode string.
	#
	#   3 (optional): Beyond normal calculations, the number of additional
	#   lines to move down before printing the mode.  Defaults to zero.
	#
	makemodal () {
		# Create new function
		eval "$1() { zle .'$1'; ${2:+VIMODE='$2'}; showmode $3 }"

		# Create new widget
		zle -N "$1"
	}

	# Extend widgets
	makemodal vi-add-eol           INSERT
	makemodal vi-add-next          INSERT
	makemodal vi-change            INSERT
	makemodal vi-change-eol        INSERT
	makemodal vi-change-whole-line INSERT
	makemodal vi-insert            INSERT
	makemodal vi-insert-bol        INSERT
	makemodal vi-open-line-above   INSERT
	makemodal vi-substitute        INSERT
	makemodal vi-open-line-below   INSERT 1
	makemodal vi-replace           REPLACE
	makemodal vi-cmd-mode          NORMAL

	unfunction makemodal

if [ -f ~/.zshrc_local ] ;then
	source ~/.zshrc_local
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
