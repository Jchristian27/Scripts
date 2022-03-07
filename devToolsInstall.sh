#!/bin/zsh

#check if Brew is already installed, if not install it (XCODE CLI Tools is a dependency)

if [ "$(command -v brew)" ];
then
	echo "Brew and XCode CLI Tools are already installed"
else
	echo "Installing Homebrew and XCode CLI Tools..."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "Installing Python3..."
brew install python3

echo "Installing PRAW..."
pip3 install praw

#create aliases

alias token='cd; cd desktop/OnlyPost; python3 refreshtoken.py'
alias post='cd; cd desktop/OnlyPost; caffeinate python3 onlypost.py'

#save aliases permanently

echo "alias token='cd; cd desktop/OnlyPost; python3 refreshtoken.py'" >> ~/.bashrc
echo "alias post='cd; cd desktop/OnlyPost; caffeinate python3 onlypost.py'" >> ~/.bashrc
echo "alias token='cd; cd desktop/OnlyPost; python3 refreshtoken.py'" >> ~/.zshrc
echo "alias post='cd; cd desktop/OnlyPost; caffeinate python3 onlypost.py'" >> ~/.zshrc
