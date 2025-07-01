function gh-create-pri
    git add .
    git commit -m "chore: upload project to GitHub"
    gh repo create --private --source=. --remote=origin
    git push -u --all
    gh browse
end


function gh-create-pub
    git add .
    git commit -m "chore: upload project to GitHub"
    gh repo create --public --source=. --remote=origin
    git push -u --all
    gh browse
end


function gh-create-pri-without
    gh repo create --private --source=. --remote=origin
    git push -u --all
    gh browse
end


function gh-create-pub-without
    gh repo create --public --source=. --remote=origin
    git push -u --all
    gh browse
end


function gh-repo-pub
	gh repo list --visibility=public
end


function gh-repo-pri
	gh repo list --visibility=private
end


function gh-repo-change-pri
	gh repo edit --visibility private --accept-visibility-change-consequences
end


function gh-repo-change-pub
	gh repo edit --visibility public --accept-visibility-change-consequences
end


function gh-repo-list-pub
    gh repo list --visibility public
end


function gh-repo-list-pri
    gh repo list --visibility private
end
