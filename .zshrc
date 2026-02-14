# cd -<tab>で以前移動したディレクトリを表示
setopt auto_pushd

# ヒストリ(履歴)を保存、数を増やす
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

# ディレクトリ名だけで移動
setopt AUTO_CD

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


alias la="ls -a"
alias ll="ls -lh"

# 入力を間違えたときの似たコマンド表示
setopt correct

# コマンドの補完
autoload -U +X bashcompinit && bashcompinit
autoload -Uz compinit && compinit

# タイプミスのディレクトリ名を補正
setopt correct_all

# ビープ音を消す
setopt no_beep

# globの拡張（**, ~ など）
setopt extended_glob

# The next line updates PATH for the Google Cloud SDK.
if [ -f "${HOME}/google-cloud-sdk/path.zsh.inc" ]; then . "${HOME}/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "${HOME}/google-cloud-sdk/completion.zsh.inc" ]; then . "${HOME}/google-cloud-sdk/completion.zsh.inc"; fi



case ${OSTYPE} in
    darwin*)
        if (( $+commands[arch] )); then
            alias x64='exec arch -arch x86_64 "$SHELL"'
            alias a64='exec arch -arch arm64e "$SHELL"'
            alias ls="ls -G"
        fi
        export DYLD_LIBRARY_PATH="/opt/homebrew/lib:$DYLD_LIBRARY_PATH"
        export LIBRARY_PATH="/opt/homebrew/lib:$LIBRARY_PATH"
        ;;
    linux*)
        alias ls="ls --color=auto"
        ;;


esac

# ホスト名を表示
export ARCH=`uname -m`

# プロンプト
autoload -Uz vcs_info
zstyle ':vcs_info:git:*' formats '%F{yellow}(%b)%f'
setopt PROMPT_SUBST

# ハッシュ値からHSLベースでRGB色を計算する関数
_hash_color() {
    local input=$1
    local hash=$(echo -n "$input" | cksum | cut -d' ' -f1)

    # 色相: 0-359 をハッシュから決定（色のバリエーション）
    local hue=$(( hash % 360 ))
    # 彩度: 60-95% の範囲（鮮やかさ）
    local sat=$(( 60 + (hash / 360) % 36 ))
    # 明度: 55-75% の範囲（暗い背景でも明るい背景でも見やすい）
    local lit=$(( 55 + (hash / 12960) % 21 ))

    # HSL → RGB 変換（整数演算、精度x1000）
    local s=$((sat * 1000 / 100))
    local l=$((lit * 1000 / 100))
    local c=$(( (1000 - ${${:-$((2 * l - 1000))}#-}) * s / 1000 ))
    local h=$(( hue * 1000 / 60 ))
    local x_mod=$(( h % 2000 - 1000 ))
    local x=$(( c * (1000 - ${x_mod#-}) / 1000 ))
    local m=$(( l - c / 2 ))

    local r g b
    if (( hue < 60 )); then
        r=$((c + m)) g=$((x + m)) b=$m
    elif (( hue < 120 )); then
        r=$((x + m)) g=$((c + m)) b=$m
    elif (( hue < 180 )); then
        r=$m g=$((c + m)) b=$((x + m))
    elif (( hue < 240 )); then
        r=$m g=$((x + m)) b=$((c + m))
    elif (( hue < 300 )); then
        r=$((x + m)) g=$m b=$((c + m))
    else
        r=$((c + m)) g=$m b=$((x + m))
    fi

    # 0-1000 → 0-255
    r=$(( r * 255 / 1000 ))
    g=$(( g * 255 / 1000 ))
    b=$(( b * 255 / 1000 ))

    printf '#%02X%02X%02X' $r $g $b
}

autoload -Uz vcs_info
zstyle ':vcs_info:git:*' formats '%F{yellow}(%b)%f'
setopt PROMPT_SUBST

precmd() {
    vcs_info
    local user_color=$(_hash_color "$USER")
    local host_color=$(_hash_color "$(hostname)")
    print -P "%F{cyan}%D{%Y-%m-%d %H:%M:%S}%f %F{${user_color}}%B%n%b%f%F{black}@%F{${host_color}}%B%m%b%f%F{black}:%F{green}%d%f ${vcs_info_msg_0_}"
}

PROMPT='%# %b'


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# python REPL startup
alias pr='PYTHONSTARTUP=~/.pythonstartup python'

[ -f ~/.zshrc.local ] && source ~/.zshrc.local


# nvm
export NVM_DIR="$HOME/.nvm"

if [ -d "$NVM_DIR" ]; then
  [ -r "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
  [ -r "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
fi