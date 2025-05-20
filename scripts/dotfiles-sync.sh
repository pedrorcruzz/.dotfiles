#!/bin/bash
export GPG_TTY=$(tty)

commit_message="auto-sync: $(date '+%Y-%m-%d %H:%M:%S')"


cd ~/.dotfiles

git add .

git commit -S -m "$commit_message"

git push origin main

sleep 1
clear
