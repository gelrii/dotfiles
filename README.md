#Dotfiles

Collection of dotfiles to speed up machine deployment. These are primarily here for my own use and convenience, but you're more than welcome to use or adapt them if you find them useful.

#Install Dotfile Dependencies and Dotfiles
git clone https://github.com/gelrii/dotscripts.git ~/.dotscripts/ && sudo dnf install -y  && curl -o /home/`whoami`/.bashrc https://raw.githubusercontent.com/gelrii/dotfiles/master/.bashrc && curl -o /home/`whoami`/.bash_aliases https://raw.githubusercontent.com/gelrii/dotfiles/master/.bash_aliases

<pre>curl -fsSL https://raw.githubusercontent.com/gelrii/dotfiles -o /tmp/dotfiles.sh && sh /tmp/dotfiles.sh</pre>
