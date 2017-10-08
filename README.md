# Configure Keepass to work on Ubuntu in Windows 10

- Setup KeeAgent in KeePass
- In Options
  - Choose Agent Mode => Agent
  - Check "Create msysGit compatible socket file" and choose a path.
    In my case, I put : `C:\tmp\ssh2`
    
 - On Ubuntu, add `msysgit2unix-socket-exit.sh` and `msysgit2unix-socket.py` in your home folder
 - In your `~/.bashrc` add those lines at the end :
 
```
export SSH_AUTH_SOCK="/tmp/.ssh-auth-sock"
if [ -s /mnt/c/tmp/ssh2 ]; then
  ~/msysgit2unix-socket.py /mnt/c/tmp/ssh2:$SSH_AUTH_SOCK
  trap "~/msysgit2unix-socket-exit.sh $$" EXIT
fi
```

- Restart your Ubuntu, and in the `/tmp` folder, you should see a file: `.ssh-auth-sock`
