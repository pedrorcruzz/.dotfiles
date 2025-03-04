#!/bin/bash
export GPG_TTY=$(tty)

commit_message="sync: atualizações automáticas - $(date '+%Y-%m-%d %H:%M:%S')"


cd ~/Workspace/second-brain

git add .

git commit -S -m "$commit_message"

git push origin main
