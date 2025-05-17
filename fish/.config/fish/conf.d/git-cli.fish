function gh-c-pri
    git add .
    git commit -m "chore: upload project to GitHub"
    gh repo create --private --source=. --remote=origin
    git push -u --all
    gh browse
end

function gh-c-pub
    git add .
    git commit -m "chore: upload project to GitHub"
    gh repo create --public --source=. --remote=origin
    git push -u --all
    gh browse
end

function gh-c-pri-w
    gh repo create --private --source=. --remote=origin
    git push -u --all
    gh browse
end

function gh-c-pub-w
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

