# profile file that runs on login

# add go-lang bin directory to path
export PATH=$PATH:/usr/local/go/bin

# adding paths for go-lang
export GOPATH=/home/j/go
export PATH=$PATH:$GOPATH/bin

# initialising gnome keyring
if [ -n "$DESKTOP_SESSION" ];then
  eval $(gnome-keyring-daemon --start)
  export SSH_AUTH_SOCK
fi

# auto-start x at login
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi
