#!/bin/bash

# Script that takes a URL and opens supported streams in mpv

# Supported Stream List:
## http://docs.livestreamer.io/plugin_matrix.html

# Depends on:
## livestreamer
## mpv
## rtmpdump

if [ "$1" ]; then
  livestreamer -p mpv $1 best
else
  echo "Please provide a stream URL to play."
fi

