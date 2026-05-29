# profile file that runs on login

# initialising gnome keyring
if [ -n "$DESKTOP_SESSION" ];then
  eval $(gnome-keyring-daemon --start 2>/dev/null | grep -v '^discover_other_daemon')
  export SSH_AUTH_SOCK
fi
