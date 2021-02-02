if [ -n "$DESKTOP_SESSION" ];then
    #eval $(gnome-keyring-daemon --start)
    eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
    export SSH_AUTH_SOCK
fi
