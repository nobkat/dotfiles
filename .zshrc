PROMPT='%F{blue}%B%n@%m%f%F{green}%d%f
%# %b'

# 補完機能
autoload -U compinit
compinit -u

# cd -<tab>で以前移動したディレクトリを表示
setopt auto_pushd

# ヒストリ(履歴)を保存、数を増やす
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# 直前と同じコマンドの場合は履歴に追加しない
setopt hist_ignore_dups

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# ヒストリ検索
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward

# ディレクトリの履歴保存 cd -<TAB>
setopt auto_pushd

alias ls="ls -G"
alias la="ls -a"
alias ll="ls -lh"

# 入力を間違えたときの似たコマンド表示
setopt correct

export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/katayama/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/katayama/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/katayama/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/katayama/google-cloud-sdk/completion.zsh.inc'; fi


# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
