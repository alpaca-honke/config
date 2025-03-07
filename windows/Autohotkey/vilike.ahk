InstallKeybdHook

SetTitleMatchMode 2
GroupAdd "Game", "Minecraft"
GroupAdd "Game", "ahk_class VALORANTUnrealWindow"

#HotIf not WinActive("ahk_group Game")

    *Space::{
        Send "{Blind}{Space}"
    }

    ;ctrl to enter
    ctrlState := "none"
    ctrlih := InputHook()
    ctrlih.KeyOpt("{All}","N")
    ctrlih.OnKeyDown := ctrlCallBack

    ctrlCallBack(ih, vk, sc) {
        global ctrlState
        ctrlState := "ctrl"
    }

    Ctrl::{
        global ctrlState
        ;global ctrlih

        Send "{Ctrl down}"
        ctrlState := "listen"
        ctrlih.Start()
        return
    }

    Ctrl up:: 
    {
        global ctrlState
        ;global ctrlih

        ctrlih.Stop()
        if (ctrlState = "ctrl" ) {
            Send "{Ctrl up}"
        } else {
            Send "{Ctrl up}"
            Send "{Enter}"
        }
        ctrlState := "none"
        return
    }

    ;Space + ShiftでBackspace
    Space & Tab::
    {
        Send "{Backspace}"
    }

    ;ESC
    Space & [::
    {
        Send "{Blind}{ESC}"
    }

    ;上下左右
    Space & h::Send "{Blind}{Left}"
    Space & j::Send "{Blind}{Down}"
    Space & k::Send "{Blind}{Up}"
    Space & l::Send "{Blind}{Right}"

    ;PageDn / PageUp
    Space & f::Send "{Blind}{PgDn}"

    space & b::Send "{Blind}{PgUp}"

    ;Home / End
    Space & 0::Send "{Blind}{Home}"
    Space & 4::Send "{Blind}{End}"

    ;行追加（i,I,a,Aは意味がないので定義しない）
    Space & o::
    {
        if (GetKeyState("Shift") = 0)
        {
            Send "{End}"
            Send "{Enter}"
        }
        else
        {
            Send "{Home}"
            Send "{Enter}"
            Send "{Up}"
            Send "{End}"
        }
    }

    Space & x::
    {
        if (GetKeyState("Shift") = 0)
        {
            Send "{Delete}"
        }
        else
        {
            Send "{BS}"
        }
    }

    ;Space & d::Send,^x
    Space & d::
    {
        if (GetKeyState("Shift") = 0)
        {
            Send "^x"
        }
        else
        {
            Send "{Delete}"
        }
    }

    Space & i::Send "{Tab}"
    Space & /::Send "^f"

    Space & y::Send "^c"
    Space & p::
    {
        if (GetKeyState("Shift") = 0)
        {
            Send "^v"
        }
        else
        {
            Send "!e"
            Send "s"
            Send "v"
            Send "{Enter}"
        }
    }

    Space & u::Send "^z"
    Space & r::Send "^y"

    ;保存する
    Space & w::Send "^s"
    ;ウィンドウを閉じる
    ^q::Send "!{F4}"
    ;タスクビュー
    Space & t::Send "#{Tab}"

    ;シフト残りで変換し損ねて確定してしまうのを防止。
    Space & Enter::
    {
        Send "{Space}"	;変換
        Send "{Enter}"	;確定
    }

    Space & ,::
    {
        Send "{Space}"	;変換
        Send "{,}"
    }

    Space & .::
    {
        Send "{Space}"	;変換
        Send "{.}"
    }

    Space & z::Send "!{vkf3}"



    ;Excel
#Hotif WinActive("ahk_class XLMAIN")
    Space & 1::Send "^{1}"
    Space & a::Send "{F2}"
    Space & i::
    {
        Send "{F2}"
        ;Send "^{Home}"
    }
    Space & c::
    {
        Send "{F2}"
        Send "{Home}"
        Send "+{End}"
    }
    Space & (::Send "^{PgUp}"
    Space & )::Send "^{PgDn}"


#Hotif WinActive("セルの書式設定")
    Space & ,::Send "^{PgUp}"
    Space & .::Send "^{PgDn}"
    ;Space & a::Send,!a
    ;Space & b::Send,!b
    ;Space & c::Send,!c
    ;Space & d::Send,!d
    ;Space & e::Send,!e
    ;Space & f::Send,!f
    ;Space & g::Send,!g
    ;Space & h::Send,!h
    ;Space & i::Send,!i
    ;Space & j::Send,!j
    ;Space & k::Send,!k
    ;Space & l::Send,!l
    ;Space & m::Send,!m
    ;Space & n::Send,!n
    ;Space & o::Send,!o
    ;Space & p::Send,!p
    ;Space & q::Send,!q
    ;Space & r::Send,!r
    Space & s::Send "!s"
    ;Space & t::Send,!t
    ;Space & u::Send,!u
    ;Space & v::Send,!v
    ;Space & w::Send,!w
    ;Space & x::Send,!x
    ;Space & y::Send,!y
    ;Space & z::Send,!z

