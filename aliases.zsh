# Shortcuts
alias copyssh="pbcopy < $HOME/.ssh/id_ed25519.pub"
alias showkey='cat $HOME/.ssh/id_ed25519.pub'
alias reloadshell="source $HOME/.zshrc"
alias reloaddns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias ll="/opt/homebrew/opt/coreutils/libexec/gnubin/ls -AhlFo --color --group-directories-first"
alias phpstorm='open -a /Applications/PhpStorm.app "`pwd`"'
alias shrug="echo '¯\_(ツ)_/¯' | pbcopy"
alias ip="curl https://diagnostic.opendns.com/myip ; echo"
alias localip="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
alias c="clear"
alias compile="commit 'compile'"
alias version="commit 'version'"

# Directories
alias dotfiles="cd $DOTFILES"
alias library="cd $HOME/Library"
alias projects="cd $HOME/Code"
alias sites="cd $HOME/Herd"

# Files
alias hostfile='sudo vim /etc/hosts'                                                          │
alias sshconfig='vim ~/.ssh/config'

# Laravel
alias a="php artisan"
alias fresh="php artisan migrate:fresh --seed"
alias tinker="php artisan tinker"
alias seed="php artisan db:seed"
alias serve="php artisan serve"

# PHP
alias cfresh="rm -rf vendor/ composer.lock && composer i"

# PHP Packages
alias pu='vendor/bin/phpunit'
alias pest='vendor/bin/pest'
alias phpstan='vendor/bin/phpstan analyse'
alias phpinsights='vendor/bin/phpinsights'
alias patrol='vendor/bin/patrol'
alias psalm='vendor/bin/psalm'
alias pint='vendor/bin/pint'

# JS
alias nfresh="rm -rf node_modules/ package-lock.json && npm install"
alias ni='npm install'
alias nu='npm update'
alias nw='npm run watch'
alias nd='npm run dev'
alias np='npm run prod'
alias nb='npm run build'

# Docker
alias docker-composer="docker-compose"

# SQL Server
alias mssql="docker run -e ACCEPT_EULA=Y -e SA_PASSWORD=LaravelWow1986! -p 1433:1433 mcr.microsoft.com/mssql/server:2017-latest"

# Git
alias gst="git status"
alias gb="git branch"
alias gc="git checkout"
alias gl="git log --oneline --decorate --color"
alias amend="git add . && git commit --amend --no-edit"
alias commit="git add . && git commit -m"
alias diff="git diff"
alias force="git push --force"
alias nuke="git clean -df && git reset --hard"
alias pop="git stash pop"
alias pull="git pull"
alias push="git push"
alias resolve="git add . && git commit --no-edit"
alias stash="git stash -u"
alias unstage="git restore --staged ."
alias wip="commit wip"

comme () {
    git add --all
    if (($# > 1))
    then
        params=''
        for i in $*
        do
            params=" $params $i"
        done
        git commit -m "$params"
    else
        git commit -m "$1"
    fi
}
