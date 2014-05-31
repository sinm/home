if [ -n "$BASHRC_LOADED" ]; then
  return
fi

export PATH=~/bin:~/.rbenv/bin:/usr/local/bin:/usr/local/go/bin:/usr/local/sbin:$PATH
if command -v rbenv >/dev/null 2>&1; then
  eval "$(rbenv init -)"
fi
export EDITOR=`which nano`
export BASHRC_LOADED=yes
