# Global settings
MNML_OK_COLOR="${MNML_OK_COLOR:-2}"
MNML_ERR_COLOR="${MNML_ERR_COLOR:-1}"

MNML_USER_CHAR="${MNML_USER_CHAR:-λ}"
MNML_INSERT_CHAR="${MNML_INSERT_CHAR:-›}"
MNML_NORMAL_CHAR="${MNML_NORMAL_CHAR:-·}"
MNML_ELLIPSIS_CHAR="${MNML_ELLIPSIS_CHAR:-..}"
MNML_BGJOB_MODE=${MNML_BGJOB_MODE:-4}

[ "${+MNML_PROMPT}" -eq 0 ] && MNML_PROMPT=(mnml_ssh mnml_pyenv mnml_status mnml_keymap)
[ "${+MNML_RPROMPT}" -eq 0 ] && MNML_RPROMPT=('mnml_cwd 2 0' mnml_git)
[ "${+MNML_INFOLN}" -eq 0 ] && MNML_INFOLN=(mnml_err mnml_jobs mnml_uhp mnml_files)

[ "${+MNML_MAGICENTER}" -eq 0 ] && MNML_MAGICENTER=(mnml_me_dirs mnml_me_ls mnml_me_git)

# Components
function mnml_status {
}

function mnml_keymap {
}

function mnml_cwd {
}

# capture exit status and reset prompt
function _mnml_zle-line-init {
    MNML_LAST_ERR="$?" # I need to capture this ASAP
    zle reset-prompt
}

# redraw prompt on keymap select
function _mnml_zle-keymap-select {
    zle reset-prompt
}

# draw infoline if no command is given
function _mnml_buffer-empty {
}

# properly bind widgets
# see: https://github.com/zsh-users/zsh-syntax-highlighting/blob/1f1e629290773bd6f9673f364303219d6da11129/zsh-syntax-highlighting.zsh#L292-L356
function _mnml_bind_widgets() {
}

# Setup
autoload -U colors && colors
setopt prompt_subst

PROMPT='$(_mnml_wrap MNML_PROMPT) '
RPROMPT='$(_mnml_wrap MNML_RPROMPT)'

_mnml_bind_widgets

bindkey -M main  "^M" buffer-empty
bindkey -M vicmd "^M" buffer-empty
