#export PS1='\[\e[0;32m\]\h:\W \u\$\[\e[0;0m\] '
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi


export PATH=/usr/local/Cellar/yarn/1.6.0/bin:$HOME/.nodebrew/current/bin:$PATH

source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc'

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
