export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="$HOME/.node/bin:$PATH"
export PATH="node_modules/.bin:vendor/bin:$PATH"
export PATH="/Users/axelcharpentier/Library/Application Support/Herd/bin/":$PATH

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="spaceship"

source $ZSH/oh-my-zsh.sh

if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi

export NVM_DIR="/Users/axelcharpentier/Library/Application Support/Herd/config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

[[ -f "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh" ]] && builtin source "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh"

export HERD_PHP_83_INI_SCAN_DIR="/Users/axelcharpentier/Library/Application Support/Herd/config/php/83/"
export HERD_PHP_84_INI_SCAN_DIR="/Users/axelcharpentier/Library/Application Support/Herd/config/php/84/"
