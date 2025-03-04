#!/bin/bash
eval $(ssh-agent -s)
ssh-add ~/.ssh/id_rsa
export GPG_TTY=$(tty)
gpg --batch --import ~/.gnupg/publ

commit_message="Atualizações automáticas - $(date '+%Y-%m-%d %H:%M:%S')"


cd ~/Workspace/second-brain

git add .

git commit -S -m "$commit_message"

git push origin main
