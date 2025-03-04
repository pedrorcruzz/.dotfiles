#!/bin/bash
eval $(ssh-agent -s)
ssh-add ~/.ssh/id_rsa
export GPG_TTY=$(tty)
gpg --batch --import ~/.gnupg/publ

commit_message="Automatic updates - $(date '+%Y-%m-%d %H:%M:%S')"


cd ~/.dotfiles

git add .

git commit -S -m "$commit_message"

git push origin main
