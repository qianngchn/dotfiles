# alias definitions
alias proxy='http_proxy="http://127.0.0.1:7777" https_proxy="http://127.0.0.1:7777"'
alias git='proxy git'

# export definitions
if [[ $(tty) = /dev/tty[0-6] ]]; then
    export LANG="en_US.UTF-8"
    export LANGUAGE="en_US:en"
    export LC_ALL="en_US.UTF-8"
fi

if [ -d "$HOME/local" ]; then
    export PATH="$HOME/local/bin:$PATH"
    export CPATH="$HOME/local/include"
    export LIBRARY_PATH="$HOME/local/lib"
    export LUA_PATH="$HOME/local/lib/lua/?.lua;;"
    export LUA_CPATH="$HOME/local/lib/lua/?.so;;"
fi

# dotmux function
dotmux() {
    if [ -z $(which tmux) ]; then
        echo "Need to install tmux first."
        echo "Try this command:"
        echo "  sudo apt-get install tmux"
        return 1
    fi

    if [ $(tmux has -t 0 &> /dev/null; echo $?) -ne 0 ]; then
        tmux new -d bash
        tmux splitw -h bash
        tmux neww bash
        tmux selectw -t 0:0
        tmux selectp -t 0:0.0
    fi

    tmux attach

    return 0
}

# dowiki function
dowiki() {
    local path=$(cd $HOME/qianngchn.github.io/wiki &> /dev/null && pwd)

    if [ -z "$path" ]; then
        echo "Need to git clone wiki first."
        echo "Try this command:"
        echo "  cd ~; git clone https://github.com/qianngchn/qianngchn.github.io.git"
        return 1
    fi

    if [ $# -ne 1 ]; then
        echo "Usage: dowiki <BRE>"
        return 1
    fi

    grep -inr --include=*.markdown "$1" "$path"

    return 0
}
