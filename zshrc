export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

# zplug

zplug 'mafredri/zsh-async', from:github
zplug 'sindresorhus/pure', use:pure.zsh, from:github, as:theme
zplug "plugins/git", from:oh-my-zsh
zplug 'zsh-users/zsh-syntax-highlighting', defer:3
zplug 'zsh-users/zsh-completions', defer:3

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

# Aliases

alias lla="ls -la"
alias cdd="cd .."
alias cddd="cd ../.."
alias cdddd="cd ../../.."

alias git=hub

export PATH="$HOME/bin:$PATH"

# Load rbenv
eval "$(rbenv init -)"

# Necessary for GPG signing Git commits

GPG_TTY=$(tty)
export GPG_TTY

for zshconfig in $HOME/.zsh/config/*.zsh; do
  source $zshconfig
done

ensure_tmux_is_running

export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
# added by travis gem
[ -f /Users/chris/.travis/travis.sh ] && source /Users/chris/.travis/travis.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/chris/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/chris/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/chris/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/chris/google-cloud-sdk/completion.zsh.inc'; fi

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/chris/.nvm/versions/node/v10.7.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/chris/.nvm/versions/node/v10.7.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/chris/.nvm/versions/node/v10.7.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/chris/.nvm/versions/node/v10.7.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
