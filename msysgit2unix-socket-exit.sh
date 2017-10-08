#!/bin/sh

BASHPIDS=`pidof bash -o %PPID -o $1`
[ "x$BASHPIDS" != "x" ] && exit 0
rm -f /tmp/msysgit2unix-socket.pid /tmp/.ssh-auth-sock
