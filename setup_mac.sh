#!/bin/sh
red=`tput setaf 1`
green=`tput setaf 2`
yellow=`tput setaf 3`
blue=`tput setaf 4`
reset=`tput sgr0`

# Variables definition
CURRENT=$PWD

source shell/install_functions.sh

# Banner
echo ""
echo " +--------------------+"
echo " | ${green}Starting Mac setup${reset} |"
echo " +--------------------+"
echo ""

# Install zim
ZIMRC_FILE=~/.zimrc
if [ -f "$ZIMRC_FILE" ]; then
  echo "${yellow}Zim seems already installed skipping step.${reset}"
else
  echo "> ${green}Installing ZIM.${reset}"
  curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
fi

echo ""

# Disable Last login on terminal
HUSHLOGIN_FILE=~/.hushlogin
if [ -f "$HUSHLOGIN_FILE" ]; then
  echo "${yellow}Hushlogin file already there.${reset}"
else
  echo "> ${green}Adding hushlogin file.${reset}"
  touch $HUSHLOGIN_FILE
fi

echo ""

# Brew install
if ! command -v brew &> /dev/null
then
  echo "> ${green}Installing brew${reset}"

  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  echo "${yellow}Brew already installed${reset}"
fi

echo ""

# Installing Brew apps
echo "> ${green}Installing brew apps${reset}"

brew bundle --file="mac/Brewfile"

echo ""

# Configuring git
echo "> ${green}Configuring git${reset}"
create_links "links/git.config"

echo ""

# Configuring ZSH
echo "> ${green}Configuring shell (ZSH)${reset}"
create_links "links/zsh.config"

echo ""

# Mac setup
echo "> ${green}Running mac setup${reset}"
./mac/macos-setup.sh

echo ""

echo "${blue}Installation finished. Please, restart the shell.${reset}"
