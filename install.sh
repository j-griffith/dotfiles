#!/usr/bin/env bash
cp -R bin ~/
cp -R .vim ~/
cp .vimrc ~/
cp .bashrc ~/
cp .gitconfig ~/
cp .git-completion.bash ~/

sudo apt-get install -y python-software-properties
sudo apt-get update
if [[ $(lsb_release -rs) =~ "14.04" ]]
then
  echo "make it work for 14.04"
  sudo apt-get install -y python-pip ruby lvm2
else
  echo "running on 12.04"
  sudo apt-get install -y python-pip ruby rubygems lvm2
fi

sudo pip install pyflakes
sudo pip install flake8
sudo pip install git-review
sudo pip install -U setuptools

sudo gem install hub
sudo gem install gist

if [ -d /home/vagrant ]; then
    cp .gitconfig ~/
    ln -s /home/vagrant/.host-ssh/id_rsa.pub /home/vagrant/.ssh/id_rsa.pub
fi

