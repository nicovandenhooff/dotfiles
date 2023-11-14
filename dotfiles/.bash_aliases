# increase readability of ls
alias ls='ls --color=auto --group-directories-first -F'
alias lss='ls --color=auto --group-directories-first -shF'
alias la='ls -a'

# increase readability of grep and auto insensitive case matching
alias grep='grep --color=auto -i'

# useful pipes into grep
alias psg='ps aux | grep'
alias lsg='ls | grep'

# human readable df
alias df='df -h'

# make finding things easier
alias findname='find . -name'
alias finddir='find . -type d -name'
alias findfile='find . -type f -name'

# prevent accidental overwrite
alias cp='cp -i'
alias mv='mv -i'

# navigation shortcuts
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../../'

# git shortcuts
alias ga='git add'
alias gaa='git add -all'
alias gf='git fetch'
alias gs='git status'
alias gpush='git push'
alias gpull='git pull'
alias gc='git commit -m'
alias glog='git log --oneline'

# copy pwd to clipboard
alias cpwd='pwd | xclip -selection clipboard'

# jupyter lab
alias jl='jupyter lab'
alias jll='jupyter lab list'
alias jls='jupyter lab stop'
alias jlnb='jupyter lab --LabApp.token='' --ip=0.0.0.0 --no-browser &'

# jupyter notebook
alias jn='jupyter notebook'
alias jnl='jupyter notebook list'
alias jns='jupyter notebook stop'
alias jnnb='jupyter notebook --NotebookApp.token='' --ip=0.0.0.0 --no-browser &'

# kill all jupyter processes
alias jkill='pkill -f jupyter'

# start vpn from config file
alias vpn='sudo openfortivpn -c /etc/openfortivpn/config'

# update everything
alias update_system='sudo apt-get update && sudo apt-get upgrade'