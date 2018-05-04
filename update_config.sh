#!/bin/bash

echo "==========backup config file======="
cp -rf ~/.pip/pip.conf     files/pip.conf
cp -rf ~/.gitconfig        files/gitconfig
cp -rf ~/.gitignore_global files/gitignore_global
cp -rf ~/.vimrc            files/vimrc
cp -rf ~/.zshrc            files/zshrc
cp -rf ~/.tmux.conf        files/tmux.conf
echo "===========backup done=============="

git fetch
git add *
git add *.*
git commit -am "update $(date +%Y%m%d%H%M)"
git push origin master
