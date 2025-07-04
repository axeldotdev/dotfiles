alias c="clear"
alias vim="nvim"

alias sites="cd $HOME/Herd"

alias cf="rm -rf vendor/ composer.lock && composer i"
alias ci="composer install"
alias cu="composer update"
alias cdu="composer dump-autoload"
alias cr="composer require"
alias crd="composer require --dev"

alias nf="rm -rf node_modules/ package-lock.json && npm install"
alias ni="npm install"
alias nu="npm update"
alias nd="npm run dev"
alias nb="npm run build"

alias a="php artisan"
alias am="php artisan migrate"
alias amf="php artisan migrate:fresh"
alias amfs="php artisan migrate:fresh --seed"
alias migrate="php artisan migrate"
alias fresh="php artisan migrate:fresh"
alias wipe="php artisan db:wipe"
alias seed="php artisan db:seed"
alias tinker="php artisan tinker"
alias serve="php artisan serve"
alias test="php artisan test"

alias phpunit="vendor/bin/phpunit"
alias pest="vendor/bin/pest"
alias phpstan="vendor/bin/phpstan analyse --memory-limit=2G"
alias insight="php artisan insight"
alias patrol="vendor/bin/patrol"
alias pint="vendor/bin/pint"
alias rector="vendor/bin/rector"

alias gs="git status"
alias gc="git commit"
alias gb="git branch"
alias gp="git push"
alias gpl="git pull"
alias gm="git merge"
alias gr="git rebase"
alias gst="git stash"

alias gus="git restore --staged ."
alias guc="git reset --soft HEAD~1"

alias master="checkout master"
alias main="checkout main"
alias develop="checkout develop"

alias wip="comme wip"
alias fix="comme fix"

checkout() {
	if [ -z "$1" ]
	then
    		echo "Usage: checkout <branch_name>"
    		return 1
  	fi

  	local branch_name="$1"

  	if git show-ref --verify --quiet "refs/heads/$branch_name"
	then
    		git checkout "$branch_name"
  	else
    		git checkout -b "$branch_name"
  	fi
}

push() {
	local branch_name="${1:-$(git symbolic-ref --short HEAD 2>/dev/null)}"

	if [ -z "$branch_name" ]; then
    		echo "Error: Unable to determine the current branch. Please provide a branch name or ensure you're in a Git repository."
    		return 1
  	fi

  	if git ls-remote --heads origin "$branch_name" | grep -q "refs/heads/$branch_name"
	then
    		git push origin "$branch_name"
  	else
    		git push -u origin "$branch_name"
  	fi
}

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

nah () {
    	git reset --hard
    	git clean -df
    	if [ -d ".git/rebase-apply" ] || [ -d ".git/rebase-merge" ]
	then
        	git rebase --abort
    	fi
}
