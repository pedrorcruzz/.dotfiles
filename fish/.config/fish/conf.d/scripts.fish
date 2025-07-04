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


function gestor-renda
    set prev_dir (pwd)
    cd ~/.dotfiles/scripts
    ./smart-spending-checker.sh
    cd $prev_dir
end


function ver-lucro
    set prev_dir (pwd)
    cd ~/.dotfiles/scripts
    ./monthly-investments-cli.sh
    cd $prev_dir
end

function remove-dsstore
    set prev_dir (pwd)
    cd ~/.dotfiles/scripts
    ./remove-dsstore.sh
    cd $prev_dir
end


