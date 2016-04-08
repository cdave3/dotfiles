#!/bin/bash
###############################
# makesymlinks.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
###############################

dir=~/.dotfiles                    # dotfiles directory
olddir=~/.dotfiles_old             # old dotfiles backup directory
files="vimrc vim agignore"                  # list of files/folders to symlink in homedir

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~/ ..."
mkdir -p $olddir
echo "done"

# change to the dotfiles directory
echo -n "cd'ing to the $dir directory..."
cd $dir
echo "done."

# move any existing dotfiles in ~/ to dotfiles_old directory
# then create symlinks from the homedir to files specified in $files above
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file $olddir
    echo "Creating symlink to $file in home directory..."
    ln -s $dir/$file ~/.$file
done

echo "finished!"

