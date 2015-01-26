#!/bin/bash

sudo easy_install pip
echo "export ANSIBLE_HOSTS=`pwd`/ansible_hosts"
xcode-select --install
echo "Wait for command line tools to finish before continuing"
read -p "Press [Enter] key to continue (but wait for CLI-tools to complete)..."
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor
brew update
brew upgrade

brew install - ansible --with-accelerate
sed 's/user.*/user:\ '`whoami`'/' macs.template.yml > macs.yml

echo "Time to ansible!"
echo "==> ansible-playbook -K -i localhost macs.yml"

echo "TimeVault?"
echo "==> Run: sudo fdesetup enable"

echo "Please remember that we will might not autoload services such as mysql"
echo "write 'brew info mysql' for more info (also check redis, rabbitmq, mysql)"
echo "if you include the role for databases, this will be done automatically but not dynamically"
