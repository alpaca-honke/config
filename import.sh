#!/usr/bin/sh

CONFDIR="$( cd "$( dirname "$0" )" && pwd -P )"
echo "conf dir is $CONFDIR ."
echo "Hit any key to continue..."
read DATA

echo "Copy files from each directory."

echo -n "~/.bashrc ~/.bash_aliases ~/.git-prompt.sh [Y/n]:"
read ANS
case $ANS in
    [Nn]* )
        echo "no"
        ;;
    * )
        echo - ~/.bashrc
        cp -f ~/.bashrc $CONFDIR/bash/.bashrc
        echo - ~/.bash_aliases
        cp -f ~/.bash_aliases $CONFDIR/bash/.bash_aliases
        echo - ~/.git-prompt.sh
        cp -f ~/.git-prompt.sh $CONFDIR/common/git-prompt.sh
        ;;
esac

echo -n "~/.zshrc ~/.git-prompt.sh [Y/n]:"
read ANS
case $ANS in
    [Nn]* )
        echo "no"
        ;;
    * )
        echo - ~/.zshrc
        cp -f ~/.zshrc $CONFDIR/zsh/.zshrc
        cp -f ~/.git-prompt.sh $CONFDIR/common/git-prompt.sh
        ;;
esac
echo -n "~/.vimrc , ~/.vimrc_common [Y/n]:"
read ANS
case $ANS in
    [Nn]* )
        echo "no"
        ;;
    * )
        echo - ~/.vimrc
        cp -f ~/.vimrc $CONFDIR/vim/.vimrc
        echo - ~/.vimrc_common
        cp -f ~/.vimrc_common $CONFDIR/common/.vimrc_common
        ;;
esac
echo -n "~/AppData/Local/nvim/init.lua, ~/.vimrc_common , ~/AppData/Local/nvim/coc-settings.json [Y/n]:"
read ANS
case $ANS in
    [Nn]* )
        echo "no"
        ;;
    * )
        echo - ~/AppData/Local/nvim/init.lua
        cp -f ~/AppData/Local/nvim/init.lua $CONFDIR/nvim/init.lua
        echo - ~/.vimrc_common
        cp -f ~/.vimrc_common $CONFDIR/common/.vimrc_common
        echo - ~/.config/nvim/coc-settings.json
        cp -f ~/AppData/Local/nvim/coc-settings.json $CONFDIR/nvim/coc-settings.json
        ;;
esac
echo -n "~/.latexmkrc [Y/n]:"
read ANS
case $ANS in
    [Nn]* )
        echo "no"
        ;;
    * )
        echo - ~/.latexmkrc
        cp -f ~/.latexmkrc $CONFDIR/tex/.latexmkrc
        ;;
esac
echo -n "~/bin/afxw*/ [Y/n]:"
read ANS
case $ANS in
    [Nn]* )
        echo "no"
        ;;
    * )
        echo - ~/bin/afxw*/
        cp -rf ~/bin/afxw64_166/AFXW.DEF  ~/bin/afxw64_166/AFXW.INI  ~/bin/afxw64_166/AFXW.KEY  ~/bin/afxw64_166/K3KEYAFX.DEF $CONFDIR/windows/afxw64_166/
esac
echo -n "~/bin/Autohotkey_vim/ [Y/n]:"
read ANS
case $ANS in
    [Nn]* )
        echo "no"
        ;;
    * )
        echo - ~/bin/Autohotkey_vim/
        cp -rf ~/bin/Autohotkey_vim/ $CONFDIR/windows/Autohotkey_vim/
esac
echo -n "~/AppData/Local/Packages/Microsoft.WindowsTerminal_*/LocalState/settings.json [Y/n]:"
read ANS
case $ANS in
    [Nn]* )
        echo "no"
        ;;
    * )
        echo - ~/AppData/Local/Packages/Microsoft.WindowsTerminal_*/LocalState/settings.json
        cp -rf ~/AppData/Local/Packages/Microsoft.WindowsTerminal_*/LocalState/settings.json $CONFDIR/windows/WindowsTerminal
esac
echo Completed.
