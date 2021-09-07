#!/bin/sh
red=`tput setaf 1`
green=`tput setaf 2`
yellow=`tput setaf 3`
reset=`tput sgr0`

# Banner

echo ""
echo " +--------------------------+"
echo " | ${green}Starting .dotfiles setup${reset} |"
echo " +--------------------------+"
echo ""

echo "${yellow}Some utilities and apps will be installed, also some apps configurations.${reset}"
echo "Do you wish to proceed? [y]: "
read decision
decision="${decision:=y}"

if [ "$decision" != "y" ]; then
  echo "${green}Exiting. No changes made.${reset}"
  exit 1
fi

# Folder check

SCRIPT_PATH=`pwd`
if [ "$HOME/.dotfiles" != $SCRIPT_PATH ]; then
  echo "${red}The .dotfiles folder seems not to be on the user home folder '$HOME'${reset}"
  echo "${red}The script is running on '$SCRIPT_PATH'${reset}"
  echo "Do you wish to proceed? [y]: "
  read decision
  decision="${decision:=y}"

  if [ "$decision" != "y" ]; then
    echo "${green}Exiting. No changes made.${reset}"
    exit 1
  fi
fi

# Links generation
echo "> ${green}Generating links to config files (Shell & Git)${reset}"
echo ""

input="links.config"
while IFS= read -r line
do
  CREATE_LINK_CMD="ln -sf $line"
  echo "${green}Created link:${reset} $CREATE_LINK_CMD"
done < "$input"

echo ""

# Brew install
echo "> ${green}Installing brew${reset}"
echo ""

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Installing Brew apps
echo "> ${green}Installing brew apps${reset}"
echo ""

brew bundle --file="apps/Brewfile"

# Mac setup
./mac/mac-setup.sh
