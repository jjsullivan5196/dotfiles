# keybinds
bindkey -v
alias vi=nvim
alias rrc='source ~/.config/zsh/.zshrc'
alias erc='vi ~/.config/zsh/.zshrc'
alias im='sxiv -t ./*.*'

# vterm
function vterm_printf() {
  if [ -n "$TMUX" ]; then
    # Tell tmux to pass the escape sequences through
    # (Source: http://permalink.gmane.org/gmane.comp.terminal-emulators.tmux.user/1324)
    printf "\ePtmux;\e\e]%s\007\e\\" "$1"
  elif [ "${TERM%%-*}" = "screen" ]; then
    # GNU screen (screen, screen-256color, screen-256color-bce)
    printf "\eP\e]%s\007\e\\" "$1"
  else
    printf "\e]%s\e\\" "$1"
  fi
}

function vterm_prompt_end() {
    vterm_printf "51;A$(whoami)@$(hostname):$(pwd)";
}

grml_theme_add_token vterm_prompt -f vterm_prompt_end
zstyle ':prompt:grml:left:setup' items rc change-root user at host path vcs percent vterm_prompt

# direnv
eval "$(direnv hook zsh)"
