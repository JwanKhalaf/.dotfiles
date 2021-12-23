# profile file that runs on login

# add .NET sdk directory to path
export PATH=$PATH:~/.dotnet
export PATH="$PATH:/home/j/.dotnet/tools"

# add .NET environment variable
export ASPNETCORE_ENVIRONMENT=Development

# set pager for postgres
export PSQL_PAGER="less -iMFXSx4R"

# initialising gnome keyring
if [ -n "$DESKTOP_SESSION" ];then
  eval $(gnome-keyring-daemon --start)
  export SSH_AUTH_SOCK
fi

# auto-start x at login
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi
