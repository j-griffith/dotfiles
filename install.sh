#!/usr/bin/env bash
cp -R bin ~/
cp -R .vim ~/
cp .vimrc ~/
cp .bashrc ~/
cp .gitconfig ~/
cp .git-completion.bash ~/

sudo apt-get install -y python-pip ruby rubygems
sudo pip install pyflakes==0.7.4
sudo pip install flake8==2.0
sudo pip install git-review
sudo gem install hub
sudo gem install gist

if [ -d /home/vagrant ]; then
    cp .gitconfig ~/
    ln -s /home/vagrant/.host-ssh/id_rsa.pub /home/vagrant/.ssh/id_rsa.pub
fi

