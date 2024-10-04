# if not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# add Homebrew to PATH
if [ -d "/opt/homebrew/bin" ]; then
    export PATH="/opt/homebrew/bin:$PATH"  # For Apple Silicon Macs
fi

# enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /opt/homebrew/etc/bash_completion ]; then
    . /opt/homebrew/etc/bash_completion
  fi
fi

# history configuration
HISTFILESIZE=50000
HISTSIZE=10000
export HISTCONTROL=ignoreboth
export HISTTIMEFORMAT='%F, %T '
PROMPT_COMMAND='history -a; echo'
stty -ixon                         # allow ctrl+s for forward history search
shopt -s histappend                # append to history file, don't overwrite

# optional shell behaviors
shopt -s autocd         # type a directory name to do "cd <name>"
shopt -s cdspell        # correct minor spelling mistakes with cd
shopt -s globstar       # "**" matches all files and 0 or more dir/subdirs
shopt -s checkwinsize   # autoresize terminal output when window size changes

# bindings
bind "set bell-style none"                  # disable the bell
bind "set completion-ignore-case On"        # ignore case in auto-completion
bind "set show-all-if-ambiguous On"         # show auto-complete on single tab
bind 'TAB':menu-complete                    # if multiple complete matches, cycle through with tab
bind "set menu-complete-display-prefix On"  # on first tab, show matches, then cycle through
bind "set match-hidden-files Off"           # only match hidden "." files explicitly
bind '"\e[H": beginning-of-line'            # home key moves to beginning of line
bind '"\e[F": end-of-line'                  # end key moves to end of line

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# add color for manpages in `less` view
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# mkdir and cd into it
function mkcd() { mkdir -p "$@" && cd "$_"; }

# tab autocomplete for ssh hosts
complete -W "$(awk '/^Host / {print $2}' ~/.ssh/config)" ssh

# check for git-prompt.sh script and download if needed
if ! [ -f ~/.git-prompt.sh ]; then
    curl -Sso ~/.git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
    echo "git-prompt.sh downloaded!"
fi

# load the git prompt script
source ~/.git-prompt.sh

# set terminal prompt
COLOR_PURPLE="\[\033[01;35m\]"
COLOR_RED="\[\033[01;31m\]"
COLOR_YELLOW="\[\033[01;33m\]"
COLOR_GREEN="\[\033[01;32m\]"
COLOR_RESET="\[\033[00m\]"

SUCCESS_SYMBOL="*"
FAIL_SYMBOL="!"

PS1_USER_HOST="${COLOR_GREEN}\u@\h"
PS1_WORKING_DIR="${COLOR_YELLOW}\w"
PS1_GIT_BRANCH="\$(__git_ps1 ' ${COLOR_PURPLE}(%s)')"
PS1_LAST_STATUS="\$([[ \$? == 0 ]] && echo \"${COLOR_GREEN}${SUCCESS_SYMBOL}\" || echo \"${COLOR_RED}${FAIL_SYMBOL}\")"

export PS1="${PS1_LAST_STATUS} ${PS1_USER_HOST} ${PS1_WORKING_DIR}${PS1_GIT_BRANCH}${COLOR_RESET}\n\$ "

# alias definitions
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac
