# .bash_aliases

# File Management
alias mkdir="mkdir -p" #Let mkdir create parent directories too if they don't already exist
alias sl="ls"
alias ll="ls -lah" #Human readable + all info
alias lg="ls | grep"
alias ..="cd .."
alias d="df -HT" #Output human readable SI units and show mount type when checking free disk space
alias dt="df -HT | grep T" #Ditto the above command but simply grep to show only disks measured in Terabytes
alias open="xdg-open" #Allow using open command to open a file with the default application
alias md5="md5sum"
alias sha256="sha256sum"

# Package Management
alias autoremove="sudo dnf autoremove"
alias install="sudo dnf install"
alias update="sudo dnf update"
alias search="sudo dnf search"

# Power Management
alias suspend="sudo pm-suspend" #It's a bad idea to just alias "sleep" as it's used as a wait command in shell scripts
alias reboot="sudo reboot"
alias hibernate="sudo pm-hibernate"

# System Info
alias temps="watch sensors"
alias entropy="cat /proc/sys/kernel/random/entropy_avail"
alias specs="phoronix-test-suite system-info"
alias info="$HOME/.dotscripts/systeminfo.sh"

# System Tools
alias newpassword="echo 'Generating New Random Password with `cat /proc/sys/kernel/random/entropy_avail` Entropy Available on System...' && echo "" && strings /dev/urandom | grep -o '[[:alnum:]]' | head -n 30 | tr -d '\n'; echo"
alias killit='echo -ne "Enter process name: "; read Process; ps aux | grep $Process | awk "{print $2}" | xargs kill;'
alias rec="recordmydesktop -o $HOME/ScreenRec_`date +%F_%R`.ogv"

# Applications
alias tor="$HOME/Tor/Browser/start-tor-browser"

# Force Root
alias iftop="sudo iftop"
alias iotop="sudo iotop"
alias killall="sudo killall"
alias netstat="sudo netstat"


# Multimedia
alias stream="sh $HOME/.dotscripts/stream.sh"
alias streamrec="sh $HOME/.dotscripts/streamrec.sh"
alias youtube="sh $HOME/Scripts/YouTube/YouTube.sh"
