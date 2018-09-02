# alias definitions
alias proxy='ALL_PROXY="socks5://127.0.0.1:7777"'
alias git='proxy git'

# export definitions
if [[ "$(tty)" = /dev/tty[0-6] ]]; then
    export LANG="en_US.UTF-8"
    export LANGUAGE="en_US:en"
    export LC_ALL="en_US.UTF-8"
fi

if [ -d "$HOME/local" ]; then
    export PATH="$HOME/local/bin:$PATH"
    export CPATH="$HOME/local/include"
    export LIBRARY_PATH="$HOME/local/lib"
fi

# dotmux function
dotmux() {
    if [ -z "$(which tmux)" ]; then
        echo "Need to install tmux first."
        echo "Try this command:"
        echo "  sudo apt install tmux"
        return 1
    fi

    if [ "$(tmux has -t 0 &> /dev/null; echo $?)" -ne 0 ]; then
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
    local path="$(cd $HOME/qianngchn.github.io/wiki &> /dev/null && pwd)"

    if [ -z "$path" ]; then
        echo "Need to git clone wiki first."
        echo "Try these commands:"
        echo "  sudo apt install pandoc && cd ~"
        echo "  git clone https://github.com/qianngchn/qianngchn.github.io.git"
        return 1
    fi

    if [ "$#" -ne 1 ]; then
        echo "Usage: dowiki <BRE>"
        return 1
    fi

    grep -rin --include=*.markdown "$1" "$path"

    return 0
}
