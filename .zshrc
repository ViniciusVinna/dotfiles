# Keep this Fig pre block at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"

# Enable Powerlevel10k instant prompt.
# Initialization code that may require console input must go above this block.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Load ~/.extra, ~/.bash_prompt, ~/.exports, ~/.aliases and ~/.functions
for file in ~/.{zshrc_config,exports,aliases,functions,extra}; do
  [ -r "$file" ] && source "$file"
done
unset file

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

# Load Travis
[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh

# Load i-term integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Load Bun completions
[ -s "${HOME}/.bun/_bun" ] && source "${HOME}/.bun/_bun"

# Configure bun
export BUN_INSTALL="${HOME}/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Load p10k configurations
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Load SDKMAN configurations
export SDKMAN_DIR="/Users/vinna/.sdkman"
[[ -s "/Users/vinna/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/vinna/.sdkman/bin/sdkman-init.sh"
export SDKMAN_OFFLINE_MODE=false

# Load Fig post block. Keep this at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"

export GPG_TTY=$(tty)

# Android SDK location
export ANDROID_HOME=$HOME
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# ZSH Plugins
source ~/.dotfiles/lib/zsh-autoenv/autoenv.zsh
