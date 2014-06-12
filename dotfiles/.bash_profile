
if [ -f ~/.bashrc ]; then
	source ~/.bashrc
fi

# Screen-compatible update_terminal_cwd()
update_terminal_cwd() {
    if [ "$TERM_PROGRAM" == "Apple_Terminal" ] && [ -z "$INSIDE_EMACS" ]; then
        # Identify the directory using a "file:" scheme URL,
        # including the host name to disambiguate local vs.
        # remote connections. Percent-escape spaces.
        local SEARCH=' '
        local REPLACE='%20'
        local PWD_URL="file://$HOSTNAME${PWD//$SEARCH/$REPLACE}"
        # Include the escapes needed for screen to forward to Terminal.app
        printf '\eP\e]7;%s\a\e\\' "$PWD_URL"
    fi
}

forward_to_screen() {
    MYSTATUS="$?"
    if [ $TERM == "screen" ]; then
        MYPWD="${PWD/#$HOME/~}"
        [ ${#MYPWD} -gt 50 ] && MYPWD="..${MYPWD:${#MYPWD}-48}"
        [ ${#MYPWD} -lt 50 ] && MYPWD=`printf %-50s "$MYPWD"`
        echo -n -e "\033k|$MYSTATUS|$MYPWD\033\\"
    fi
}

export PS1="\t \u\$ "
export PROMPT_COMMAND="forward_to_screen; update_terminal_cwd; history -a;"

unset HISTFILESIZE
export HISTSIZE=1000000
export HISTTIMEFORMAT='%F %T '
shopt -s histappend

export COLORFGBG="white;black"
