# Installation

!!! DO NOT use setup.sh

## How to setup linux environment 

```shell
sh install.sh
```


## How to install dotfiles

```shell
git clone https://github.com/nobkat/dotfiles.git
cd dotfiles
sh install_dotfile.sh
```

if you get error in git clone try

```shell
cd .ssh
ssh-keygen -t rsa
cat id_rsa.pub
```

copy key to https://github.com/settings/ssh

## How to update dotefiles

```shell
cd dotfiles
vim .vimrc    # for example ...
git add .vimrc
git commit -m "update .vimrc"
git push
```






