#!/bin/bash

# Script to ask for a URL and description with popups and record 
# supported streams in a file named with recording time and description

# Supported Stream List:
## http://docs.livestreamer.io/plugin_matrix.html

# Depends on:
## livestreamer
## rtmpdump
## zenity

link=$(zenity --title "Livestreamer" --entry --text="Stream URL to Open")
descr=$(zenity --title "Livestreamer" --entry --text="File Description")

if [ $? = 0 ]; then
 livestreamer -o $HOME/Downloads/Streams/StreamRec_${descr}_`date +%F-%T`.mp4 ${link} best
else
  echo "Quit"
fi

