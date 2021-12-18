# profile file that runs on login

# add .NET sdk directory to path
export PATH=$PATH:~/.dotnet

# initialising gnome keyring
if [ -n "$DESKTOP_SESSION" ];then
  eval $(gnome-keyring-daemon --start)
  export SSH_AUTH_SOCK
fi

# auto-start x at login
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi
