if filereadable(expand('~/.vimrc_common'))
	source ~/.vimrc_common
endif

" if yanked, copy to clipboard too
set clipboard=unnamed,autoselect
" change swap directory
set directory=~/.vim/tmp

" enable mouse
if has("mouse")
	set mouse=a
	if has("mouse-sgr")
		set ttymouse=sgr
	elseif v:version > 703 || v:version is 703 && has ("patch632")
		set ttymouse=sgr
	else
		set ttymouse=xterm2
	endif
endif
