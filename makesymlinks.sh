#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
bashdir=~/dotfiles/bash
olddir=~/dotfiles_old             # old dotfiles backup directory
files="bash_profile gitconfig vimrc.before.local vimrc.bundles.local vimrc.local"    # list of files/folders to symlink in homedir
bashFiles="git-completion.bash git-prompt.sh"
##########

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

for file in $bashFiles; do
    echo "Moving any existing bash files from ~ to $bashdir"
    echo "Creating symlink to $file in home directory."
    ln -s $bashdir/$file ~/$file
done
