ZSH_THEME="clean"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"

zstyle ':omz:update' mode auto
plugins=(git)

source $ZSH/oh-my-zsh.sh

[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"

# Shell-GPT integration ZSH v0.1
_sgpt_zsh() {
    _sgpt_prev_cmd=$BUFFER
    BUFFER+="⌛"
    zle -I && zle redisplay
    BUFFER=$(sgpt --shell <<< "$_sgpt_prev_cmd")
    zle end-of-line
}
zle -N _sgpt_zsh
bindkey ^l _sgpt_zsh
# Shell-GPT integration ZSH v0.1
