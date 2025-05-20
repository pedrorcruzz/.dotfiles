function syo
    set prev_dir (pwd)
    cd ~/.dotfiles/scripts
    ./obsidian-sync.sh
    cd $prev_dir
end

function syd
    set prev_dir (pwd)
    cd ~/.dotfiles/scripts
    ./dotfiles-sync.sh
    cd $prev_dir
end

function ccache
    set prev_dir (pwd)
    cd ~/.dotfiles/scripts
    ./clear-cache.sh
    cd $prev_dir
end


