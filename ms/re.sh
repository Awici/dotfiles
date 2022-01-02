#!/bin/bash

loc=$(curl -s "ipinfo.io" | jq -r ".loc" | sed 's/,/:/g')
redshift -l $loc

