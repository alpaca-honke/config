#!/usr/bin/sh

CONFDIR="$( cd "$( dirname "$0" )" && pwd -P )"
echo "conf dir is $CONFDIR ."
echo "Hit any key to continue..."
read DATA

echo -n "This machine is Unix/Windows? [u/w]:"
read MACHINE
case $MACHINE in
    [Uu]* )
        echo "Unix"

        echo "Make symbolic link to each directory."

        echo -n "~/.bashrc ~/.bash_aliases ~/.git-prompt.sh [Y/n]:"
        read ANS
        case $ANS in
            [Nn]* )
                echo "no"
                ;;
            * )
                echo - ~/.bashrc
                ln -sf $CONFDIR/bash/.bashrc ~/.bashrc
                echo - ~/.bash_aliases
                ln -sf $CONFDIR/bash/.bash_aliases ~/.bash_aliases
                echo - ~/.git-prompt.sh
                ln -sf $CONFDIR/common/git-prompt.sh ~/.git-prompt.sh
                ;;
        esac

        echo -n "~/.config/fish/config.fish [Y/n]:"
        read ANS
        case $ANS in
            [Nn]* )
                echo "no"
                ;;
            * )
                echo - ~/.config/fish/config.fish
                ln -sf $CONFDIR/fish/config.fish ~/.config/fish/config.fish
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
                ln -sf $CONFDIR/zsh/.zshrc ~/.zshrc
                ln -sf $CONFDIR/common/git-prompt.sh ~/.git-prompt.sh
                ;;
        esac
        echo -n "~/.config/powershell/Microsoft.PowerShell_profile.ps1 [Y/n]:"
        read ANS
        case $ANS in
            [Nn]* )
                echo "no"
                ;;
            * )
                echo - ~/.config/powershell/Microsoft.PowerShell_profile.ps1
                ln -sf $CONFDIR/pwsh/Microsoft.PowerShell_profile.ps1 ~/.config/powershell/Microsoft.PowerShell_profile.ps1
                ;;
        esac
        echo -n "~/.vimrc , ~/.vimrc_common , ~/.vim/tmp [Y/n]:"
        read ANS
        case $ANS in
            [Nn]* )
                echo "no"
                ;;
            * )
                echo - ~/.vim/tmp
                mkdir -p ~/.vim/tmp
                echo - ~/.vimrc
                ln -sf $CONFDIR/vim/.vimrc ~/.vimrc
                echo - ~/.vimrc_common
                ln -sf $CONFDIR/common/.vimrc_common ~/.vimrc_common
                ;;
        esac
        echo -n "~/.config/nvim/init.lua, ~/.vimrc_common , ~/.config/nvim/coc-settings.json [Y/n]:"
        read ANS
        case $ANS in
            [Nn]* )
                echo "no"
                ;;
            * )
                echo - ~/.config/nvim/init.lua
                mkdir -p ~/.config/nvim
                ln -sf $CONFDIR/nvim/init.lua ${XDG_CONFIG_HOME:-~/.config}/nvim/init.lua
                echo - ~/.vimrc_common
                ln -sf $CONFDIR/common/.vimrc_common ~/.vimrc_common
                echo - ~/.config/nvim/coc-settings.json
                ln -sf $CONFDIR/nvim/coc-settings.json ${XDG_CONFIG_HOME:-~/.config}/nvim/coc-settings.json
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
                ln -sf $CONFDIR/tex/.latexmkrc ~/.latexmkrc
                ;;
        esac

        echo Completed.
        ;;
    [wW]* )
        echo "Windows"
        echo "Copy files to each directory."

        echo -n "~/.bashrc ~/.bash_aliases ~/.git-prompt.sh [Y/n]:"
        read ANS
        case $ANS in
            [Nn]* )
                echo "no"
                ;;
            * )
                echo - ~/.bashrc
                cp -f $CONFDIR/bash/.bashrc ~/.bashrc
                echo - ~/.bash_aliases
                cp -f $CONFDIR/bash/.bash_aliases ~/.bash_aliases
                echo - ~/.git-prompt.sh
                cp -f $CONFDIR/common/git-prompt.sh ~/.git-prompt.sh
                ;;
        esac

        echo -n "~/.config/fish/config.fish [Y/n]:"
        read ANS
        case $ANS in
            [Nn]* )
                echo "no"
                ;;
            * )
                echo - ~/.config/fish/config.fish
                cp -f $CONFDIR/fish/config.fish ~/.config/fish/config.fish
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
                cp -f $CONFDIR/zsh/.zshrc ~/.zshrc
                cp -f $CONFDIR/common/git-prompt.sh ~/.git-prompt.sh
                ;;
        esac
        echo -n "~/.config/powershell/Microsoft.PowerShell_profile.ps1 [Y/n]:"
        read ANS
        case $ANS in
            [Nn]* )
                echo "no"
                ;;
            * )
                echo - ~/.config/powershell/Microsoft.PowerShell_profile.ps1
                cp -f $CONFDIR/pwsh/Microsoft.PowerShell_profile.ps1 ~/.config/powershell/Microsoft.PowerShell_profile.ps1
                ;;
        esac
        echo -n "~/.vimrc , ~/.vimrc_common , ~/.vim/tmp [Y/n]:"
        read ANS
        case $ANS in
            [Nn]* )
                echo "no"
                ;;
            * )
                echo - ~/.vim/tmp
                mkdir -p ~/.vim/tmp
                echo - ~/.vimrc
                cp -f $CONFDIR/vim/.vimrc ~/.vimrc
                echo - ~/.vimrc_common
                cp -f $CONFDIR/common/.vimrc_common ~/.vimrc_common
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
                mkdir -p ~/AppData/Local/nvim
                cp -f $CONFDIR/nvim/init.lua ~/AppData/Local/nvim/init.lua
                echo - ~/.vimrc_common
                cp -f $CONFDIR/common/.vimrc_common ~/.vimrc_common
                echo - ~/.config/nvim/coc-settings.json
                cp -f $CONFDIR/nvim/coc-settings.json ~/AppData/Local/nvim/coc-settings.json
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
                cp -f $CONFDIR/tex/.latexmkrc ~/.latexmkrc
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
                cp -rf $CONFDIR/windows/afxw64_166/ ~/bin/afxw64_166/
        esac
        echo -n "~/bin/Autohotkey_vim/ [Y/n]:"
        read ANS
        case $ANS in
            [Nn]* )
                echo "no"
                ;;
            * )
                echo - ~/bin/Autohotkey_vim/
                cp -rf $CONFDIR/windows/Autohotkey_vim/ ~/bin/Autohotkey_vim/
        esac
        echo Completed.
        ;;
esac
