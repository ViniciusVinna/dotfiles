# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/bash_profile.pre.bash" ]] && builtin source "$HOME/.fig/shell/bash_profile.pre.bash"

# Load Homebrew shell environment
eval "$(/opt/homebrew/bin/brew shellenv)"

# Load ~/.extra, ~/.bash_prompt, ~/.exports, ~/.aliases and ~/.functions
# ~/.extra can be used for settings you don’t want to commit
for file in ~/.{bash_colors,bash_completion,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && source "$file"
done
unset file

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

export GPG_TTY=$(tty)
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults

# Completion for npm
if $(command -v complete) &>/dev/null; then
  _npm_completion () {
    local words cword
    if $(command -v _get_comp_words_by_ref) &>/dev/null; then
      _get_comp_words_by_ref -n = -n @ -n : -w words -i cword
    else
      cword="$COMP_CWORD"
      words=("${COMP_WORDS[@]}")
    fi

    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$cword" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${words[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
    if $(command -v __ltrim_colon_completions) &>/dev/null; then
      __ltrim_colon_completions "${words[cword]}"
    fi
  }
  complete -o default -F _npm_completion npm
fi

# Setup paths
# init fnm
export FNM_DIR=/usr/local/fnm
eval "$(fnm env)"

# Ruby paths
export RUBY_PATH="$(brew --prefix)/opt/ruby/bin"
export GEM_HOME="$(brew --prefix)/opt/gems"
export GEM_PATH="$GEM_HOME/bin"

# PHP path
export PHP_PATH="$(brew --prefix)/opt/php/bin"

# Volta path
export VOLTA_HOME="$HOME/.volta"

# Setup PATH
PATH="./node_modules/.bin:$PATH"
PATH="$(brew --prefix)/sbin:$PATH"
PATH="$(brew --prefix)/opt/coreutils/libexec/gnubin:$PATH"
PATH="$PHP_PATH:$PATH"
PATH="$RUBY_PATH:$PATH"
PATH="$GEM_PATH:$PATH"
PATH="$VOLTA_HOME/bin:$PATH"

# Source various shell scripts
# bash_completion
export BASH_COMPLETION_COMPAT_DIR="$(brew --prefix)/etc/bash_completion.d"
[[ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]] && . "$(brew --prefix)/etc/profile.d/bash_completion.sh"

# travis
[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh

# iterm2_shell_integration
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# Alias setup
eval "$(hub alias -s)"
eval "$(pyenv init --path)"
eval $(thefuck --alias)

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/bash_profile.post.bash" ]] && builtin source "$HOME/.fig/shell/bash_profile.post.bash"
