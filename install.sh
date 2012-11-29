#!/usr/bin/env bash
cp -R .vim ~/
cp .vimrc ~/
cp .gitconfig ~/
sudo apt-get install pyflakes
sudo pip install git-review
if [ -d /home/vagrant ]; then
    cp .gitconfig ~/
    ln -s /home/vagrant/.host-ssh/id_rsa.pub /home/vagrant/.ssh/id_rsa.pub
fi

