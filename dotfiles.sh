#!/bin/bash

echo "Installing dependancies..."
sudo dnf install recordmydesktop livestreamer rtmpdump zenity mpv aria2 youtube_dl phoronix-test-suite
echo "Complete!"
echo "Grabbing dotfiles..."
git clone https://github.com/gelrii/dotfiles/.dotscripts ~/.dotscripts/
curl -o /home/`whoami`/.bashrc https://raw.githubusercontent.com/gelrii/dotfiles/master/.bashrc
curl -o /home/`whoami`/.bash_aliases https://raw.githubusercontent.com/gelrii/dotfiles/master/.bash_aliases
echo "Complete!"
