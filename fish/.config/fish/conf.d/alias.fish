#Alias Directory
abbr -a W "cd ~/Workspace"
abbr -a S "cd ~/Workspace/Studies"
abbr -a SRC "cd ~/Workspace/Scripts"
abbr -a C "cd ~/Workspace/Cesmac"
abbr -a T "cd ~/Workspace/Seven"
abbr -a P "cd ~/Workspace/Projects"
abbr -a G "cd ~/Workspace/Guru"
abbr -a PH "cd ~/Applications/XAMPP/xamppfiles/htdocs/projects"

#Alias System
abbr -a lg "lazygit"
abbr -a cd "z"
abbr -a lzd "lazydocker"
abbr -a rn "nvim"
abbr -a vim "nvim"
abbr -a y "yazi"
abbr -a live "live-server"
abbr -a sv "source venv/bin/activate.fish"
abbr -a dv "deactivate"

#Alias Kill Process
abbr -a klsp "kill (pgrep -f 'n')"
abbr -a kls5 'kill -9 (lsof -t -i:5432)'
abbr -a kls6 'kill -9 (lsof -t -i:6060)'
abbr -a kls8 'kill -9 (lsof -t -i:8000)'


#Alias Python
abbr -a pipu "pip install --upgrade pip"
abbr -a pyvenv "python3 -m venv venv"


#Alias Git
abbr -a gcn "git clone"
abbr -a gbdr "git push origin --delete"
abbr -a gcmsgs "git commit -S -m"
abbr -a gtag "git tag -a"
abbr -a gtagp "git push origin --tags"
abbr -a gtagd "git tag -d"
abbr -a gtagdr "git push origin --delete refs/tags/"

#Alias Git CLI COPILOT
abbr -a ghcs "gh copilot suggest"
abbr -a ghcf "gh copilot fix"
abbr -a ghce "gh copilot explain"


#Alias Tmux
abbr -a tls "tmux list-sessions"
abbr -a TH "tmux attach-session -t Home"
abbr -a TN "tmux new-session -s Home"
abbr -a tas "tmux attach-session -t"
abbr -a tda "tmux detach"
abbr -a taa "tmux attach-session -t Home || tmux new-session -s Home"
abbr -a tnn "tmux new-session -s"
abbr -a tks "tmux kill-session -t"





