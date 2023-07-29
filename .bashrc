# Fig pre block. This should always be at the top of the file.
if [[ -f "$HOME/.fig/shell/bashrc.pre.bash" ]]; then
    builtin source "$HOME/.fig/shell/bashrc.pre.bash"
else
    echo "Warning: Unable to find '$HOME/.fig/shell/bashrc.pre.bash'."
fi

# Only source .bash_profile if we are in an interactive shell
if [ -n "$PS1" ]; then
    source ~/.bash_profile
fi

# Source the completion script for 'serverless'
# Uninstall by removing these lines or running 'tabtab uninstall serverless'
SERVERLESS_COMPLETION_PATH="/usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash"
if [ -f "$SERVERLESS_COMPLETION_PATH" ]; then
    . "$SERVERLESS_COMPLETION_PATH"
else
    echo "Warning: Unable to find serverless completion script at '$SERVERLESS_COMPLETION_PATH'."
fi

# Source the completion script for 'sls'
# Uninstall by removing these lines or running 'tabtab uninstall sls'
SLS_COMPLETION_PATH="/usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash"
if [ -f "$SLS_COMPLETION_PATH" ]; then
    . "$SLS_COMPLETION_PATH"
else
    echo "Warning: Unable to find sls completion script at '$SLS_COMPLETION_PATH'."
fi

# Fig post block. This should always be at the bottom of the file.
if [[ -f "$HOME/.fig/shell/bashrc.post.bash" ]]; then
    builtin source "$HOME/.fig/shell/bashrc.post.bash"
else
    echo "Warning: Unable to find '$HOME/.fig/shell/bashrc.post.bash'."
fi
