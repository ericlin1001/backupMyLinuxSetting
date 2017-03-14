#!/bin/bash
cp ~/.vimrc ./backup/
cp ~/.bashrc ./backup/
cp -r ~/.bin ./backup/
cp -r ~/.vim ./backup/
cp -r .ssh ./backup/
cp /etc/hosts ./backup/
git add .
git commit -m 'updated by script'
git push
