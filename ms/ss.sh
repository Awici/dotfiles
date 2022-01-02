#!/bin/bash

echo "waiting"
sleep 5;
# maim -s | xclip -selection clipboard -t image/png -i
maim -s | tee ~/Documents/notes/screenshots/$(date +%s).png | xclip -selection clipboard -t image/png
echo "screenshot taken"
