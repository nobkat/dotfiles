# Installation

!!! dont use setup.sh


install dotfile

```
$ git clone https://github.com/nobkat/dotfiles.git
$ cd dotfiles
$ sh install_dotfile.sh
```

if you get error in git clone try
```
$ cd .ssh
$ ssh-keygen -t rsa
$ cat id_rsa.pub
```
copy key to https://github.com/settings/ssh

update dotefile

```
$ cd dotfiles
$ vim .vimrc    # for example ...
$ git add .vimrc
$ git commit -m "update .vimrc"
$ git push
```






