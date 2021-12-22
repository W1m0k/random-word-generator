#!/bin/bash

# Random Word Generator
# linuxconfig.org

# Constants
ALL_NON_RANDOM_WORDS=./wordlist.txt

# total number of non-random words available
non_random_words=`cat $ALL_NON_RANDOM_WORDS | wc -l`

# while loop to generate random words
# number of random generated words depends on supplied argument
while [ 1 ]
do
random_number=`od -N3 -An -i /dev/urandom |
awk -v f=0 -v r="$non_random_words" '{printf "%i\n", f + r * $1 / 16777216}'`
rtxt=$(sed `echo $random_number`"q;d" $ALL_NON_RANDOM_WORDS)
xdotool type "$rtxt"
sleep $((RANDOM % 10))
xdotool key KP_Enter
sleep 1m 10s
sleep $((RANDOM % 10))
done
