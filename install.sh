#!/bin/bash
DIR=~/dot-files
PROFILE=~/.bashrc

git clone git@github.com:wtfil/dot-files.git $DIR
if hash apt-get 2>/dev/null; then
    sudo apt-get install screen
    sudo chmod +s /usr/bin/screen
    sudo chmod 755 /var/run/screen
    cp $DIR/.screenrc ~
else
    echo 'apt-get is not find; screen is not instaled';
fi;

cp $DIR/.bashrc ~
ln -sf $PROFILE ~/.profile
ln -sf $PROFILE ~/.bash_login
cp $DIR/.git-completion.bash ~
cp $DIR/.gitconfig ~
cp $DIR/.bash_aliases ~
cp $DIR/.npmrc ~
cp $DIR/.vimrc ~
cp -r $DIR/.vim ~
cp $DIR/.mongorc.js ~

if [ $TERM=='cigwin' ]; then
    mkdir -p ~/AppData/Roaming/Console/
    cp $DIR/console.xml ~/AppData/Roaming/Console/
fi

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

. ~/.bashrc
