# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zprofile.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zprofile.pre.zsh"
eval "$(/opt/homebrew/bin/brew shellenv)"

# init fnm
export FNM_DIR=/usr/local/fnm
eval "$(fnm env)"

### Paths

# Ruby paths
export RUBY_PATH="$(brew --prefix)/opt/ruby/bin"
export GEM_HOME="$(brew --prefix)/opt/gems"
export GEM_PATH="$GEM_HOME/bin"

# PHP path
# export PHP_PATH="$(brew --prefix)/opt/php/bin"
export PHP_PATH="$(brew --prefix)/opt/php@7.4/bin"

export GOPATH="${HOME}/Documents/Go"

PATH="./node_modules/.bin:$PATH"
PATH="$(brew --prefix)/sbin:$PATH"
# PATH="$(brew --prefix)/opt/coreutils/libexec/gnubin:$PATH"
PATH="$PHP_PATH:$PATH"
PATH="$RUBY_PATH:$PATH"
PATH="$GEM_PATH:$PATH"
PATH="$GOPATH:$PATH"
PATH="/usr/local/bin:$PATH"

export DOCKER_CLIENT_TIMEOUT=120
export COMPOSE_HTTP_TIMEOUT=120
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
export PATH=/Users/vinna/.bin:$PATH

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zprofile.post.zsh" ]] && builtin source "$HOME/.fig/shell/zprofile.post.zsh"
