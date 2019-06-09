#!/bin/sh

sudo apt update
sudo apt install vim curl ssh tmux git -y


# key
mkdir -p $HOME/.ssh
cd $HOME/.ssh
cat <<EOF >> authorized_keys
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDTY//OSlDR2Fqvtprlf2jAeiqL2Bzr2Ny19tmGySYE9C/8weLtb7ZEQuKpLpGwLXZwUulH1Zn1mZl0uxTXfHNl2oYn1VdUkd0HAskKZ6IW17CMikD9WiFpa7mfnuATm7ZnGovWvCG8eLbqq709FR6T+0oDUYRuFI8tNGZCNSENlN+FguicrVNe1UCW50Qt19R71le7OhxnhtO20mT94eg8GUt+CpwNngrk0Q7lmgdD0D6viKH3p6/jIMV6A5jhz+uMERfjU/zcN3HVsLZ/UQp7wQkpVFjWG13LCRbBf5tHU9nmH4Njd1Mg6YIKV69nzjdsHxd7OYOvUjEPsVM7z4iR katayama@honnosuke.local
EOF
chmod 600 authorized_keys

cd $(dirname $0)
sh install_dotfile.sh



