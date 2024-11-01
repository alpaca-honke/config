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
    echo -n "~/.config/wezterm/wezterm.lua [Y/n]: "
    read ANS
    case $ANS in
        [Nn]* )
            echo "no"
            ;;
        * )
            echo - ~/.config/wezterm/wezterm.lua
            mkdir -p ${XDG_CONFIG_HOME:-~/.config}/wezterm
            ln -sf $CONFDIR/wezterm/wezterm.lua ${XDG_CONFIG_HOME:-~/.config}/wezterm/wezterm.lua
            ;;
    esac
    echo -n "HackGen NF Font [Y/n]: "
    read ANS
        case $ANS in
            [Nn]* )
                echo "no"
                ;;
            * )
                echo - ~/.local/share/fonts/HackGen_NF/HackGen_NF_vx.x.x
                mkdir -p ~/.local/share/fonts/HackGen_NF/
                wget https://github.com/yuru7/HackGen/releases/download/v2.9.0/HackGen_NF_v2.9.0.zip
                unzip $CONFDIR/HackGen_NF_*.zip -d ~/.local/share/fonts/HackGen_NF/
                rm HackGen_NF_*.zip && echo "deleted $(pwd)/HackGen_NF_+*.zip"
                ;;
        esac
        echo -n "~/.config/skkdic [Y/n]:"
        read ANS
        case $ANS in
            [Nn]* )
                echo "no"
                ;;
            * )
                echo - ${XDG_CONFIG_HOME:-~/.config}/skkdic
                mkdir -p ${XDG_CONFIG_HOME:-~/.config}/skkdic
                ln -sf $CONFDIR/skk/SKK-JISYO.L ${XDG_CONFIG_HOME:-~/.config}/skkdic/SKK-JISYO.L
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
        echo -n "LaTeX custom packages [Y/n]:"
        read ANS
        case $ANS in
            [Nn]* )
                echo "no"
                ;;
            * )
                echo "!!!LaTeX custom packages installing script has not written for linux!!!"
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
	echo -n "~/.config/skkdic [Y/n]:"
        read ANS
        case $ANS in
            [Nn]* )
                echo "no"
                ;;
            * )
                echo - ~/.config/skkdic
                mkdir -p ~/.config/skkdic
                cp -f $CONFDIR/skk/SKK-JISYO.L ~/.config/skkdic/SKK-JISYO.L
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
        echo -n "LaTeX custom packages [Y/n]:"
        read ANS
        case $ANS in
            [Nn]* )
                echo "no"
                ;;
            * )
                echo -n "Your TeX Live version? :"
                read VERSION
                echo - mylt.sty
                mkdir -p /c/texlive/${VERSION}/texmf-dist/tex/lualatex/mylt
                cp -f $CONFDIR/tex/mylt.sty /c/texlive/${VERSION}/texmf-dist/tex/lualatex/mylt/mylt.sty
                echo - mybeamer.sty
                mkdir -p /c/texlive/${VERSION}/texmf-dist/tex/lualatex/mybeamer
                cp -f $CONFDIR/tex/mybeamer.sty /c/texlive/${VERSION}/texmf-dist/tex/lualatex/mybeamer/mybeamer.sty
        esac
        echo -n "~/bin/afxw*/ [Y/n]:"
        read ANS
        case $ANS in
            [Nn]* )
                echo "no"
                ;;
            * )
                echo - ~/bin/afxw*/
                cp -f $CONFDIR/windows/afxw64_166/AFXW.DEF ~/bin/afxw64_166/AFXW.DEF
                cp -f $CONFDIR/windows/afxw64_166/AFXW.HIS ~/bin/afxw64_166/AFXW.HIS
                cp -f $CONFDIR/windows/afxw64_166/AFXW.INI ~/bin/afxw64_166/AFXW.INI
                cp -f $CONFDIR/windows/afxw64_166/AFXW.KEY ~/bin/afxw64_166/AFXW.KEY
                cp -f $CONFDIR/windows/afxw64_166/K3KEYAFX.DEF ~/bin/afxw64_166/K3KEYAFX.DEF
        esac
        echo -n "~/bin/Autohotkey/ [Y/n]:"
        read ANS
        case $ANS in
            [Nn]* )
                echo "no"
                ;;
            * )
                echo - ~/bin/Autohotkey_vim/
                cp -f $CONFDIR/windows/Autohotkey/vilike.ahk ~/bin/Autohotkey/vilike.ahk
                cp -f $CONFDIR/windows/Autohotkey/vilike.md ~/bin/Autohotkey/vilike.md
                cp -f $CONFDIR/windows/Autohotkey/touchpad.ahk ~/bin/Autohotkey/touchpad.ahk
        esac
        echo -n "~/AppData/Local/Packages/Microsoft.WindowsTerminal_*/LocalState/settings.json [Y/n]:"
        read ANS
        case $ANS in
            [Nn]* )
                echo "no"
                ;;
            * )
                echo - ~/AppData/Local/Packages/Microsoft.WindowsTerminal_*/LocalState/settings.json
                cp -f $CONFDIR/windows/WindowsTerminal/settings.json ~/AppData/Local/Packages/Microsoft.WindowsTerminal_*/LocalState/settings.json
        esac
        echo Completed.
        ;;
esac
