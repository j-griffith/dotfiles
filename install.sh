#!/usr/bin/env bash
cp -R .vim ~/
cp .vimrc ~/
cp .gitconfig ~/
sudo apt-get install pyflakes
if [ -d /home/vagrant ]; then
    cp .gitconfig ~/
    sudo apt-get install pyflakes
    ln -s /home/vagrant/.host-ssh/id_rsa.pub /home/vagrant/.ssh/id_rsa.pub
    sudo pip install git-review
fi

