if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export BROWSER=safari

function new-tmux-from-dir-name {
    dir_name=$(echo `basename $PWD` | tr '.' '-')
    tmux new-session -As $dir_name
}

# function new-tmux-from-dir-name {
#   tmux new-session -As `basename $PWD`
# }

# Tmux
alias tnew="new-tmux-from-dir-name"

alias g='mvim --remote-silent'
alias gvim='gnvim'
alias ll='ls -la'
alias gs='git status'

export SBT_OPTS="-Xmx2G -Xss2M -XX:+UseConcMarkSweepGC -XX:+CMSClassUnloadingEnabled"

export PATH=/usr/local/bin:$PATH
$PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH
