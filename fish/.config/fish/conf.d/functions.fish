# Alias with functions
    function c
        clear
    end


function l
    # echo (date) 
    ls -la
end

# function cd
#     z $argv
# end

    function cat
        command bat $argv
    end

    function ls
        command eza --icons=always $argv
    end


function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file=$tmp
    
    set cwd (cat $tmp)
    
    if test -n "$cwd" -a "$cwd" != (pwd)
        cd $cwd
    end
    
    rm -f $tmp
end

function rfswap
    rm -rf ~/.local/state/nvim/swap/*
end

function ghosttyconfig
    set prev_dir (pwd)
    cd ~/Library/Application\ Support/com.mitchellh.ghostty/
    nvim config
    cd $prev_dir
end

function ff
    set current_dir (pwd)
    pushd ~/.config/fastfetch > /dev/null
    fastfetch
    popd > /dev/null
    cd $current_dir
end

#Docker Compose
# function start_project
#     cd /caminho/do/projeto
#     docker compose up
# end

function stardew
    cd ~/Library/Application\ Support/Steam/steamapps/common/Stardew\ Valley/Contents/MacOS
    ./StardewModdingAPI
end

function asdf
    if test (pwd) = $HOME
        command asdf $argv
        return
    end

    if test (count $argv) -ge 3; and test $argv[1] = "set"
        command asdf $argv

        if test -f .gitignore
            if not grep -q ".tool-versions" .gitignore
                set last_char (tail -c1 .gitignore)
                if test "$last_char" != "\n"
                    printf ".tool-versions\n" >> .gitignore
                else
                    printf ".tool-versions\n" >> .gitignore
                end
            end
        else
            printf ".tool-versions\n" > .gitignore
        end
    else
        command asdf $argv
    end
end
