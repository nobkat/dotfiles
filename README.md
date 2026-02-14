# Installation

!!! DO NOT use setup.sh


## How to install dotfiles

```shell
apt install git
git clone https://github.com/nobkat/dotfiles.git && dotfiles/install_dotfiles.sh
```

if you want to install other tools, run

```shell
dotfiles/install_env.sh
```

if you want to use zsh as your default shell, run

```shell
sudo apt install zsh -y
chsh -s $(which zsh)
```


## How to update dotefiles

```shell
cd dotfiles
vim .vimrc    # for example ...
git add .vimrc
git commit -m "update .vimrc"
git push
```
