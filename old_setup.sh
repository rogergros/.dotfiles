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

# Install zim
ZIMRC_FILE=~/.zimrc
if [ -f "$ZIMRC_FILE" ]; then
  echo "${green}Zim seems already installed skipping step.${reset}"
else
  echo "> ${green}Installing ZIM.${reset}"
  curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
fi

echo ""

# Disable Last login on terminal
HUSHLOGIN_FILE=~/.hushlogin
if [ -f "$HUSHLOGIN_FILE" ]; then
  echo "${green}Hushlogin file already there.${reset}"
else
  echo "> ${green}Adding hushlogin file.${reset}"
  touch $HUSHLOGIN_FILE
fi

# Links generation
echo "> ${green}Generating links to config files (Shell & Git)${reset}"

input="links.config"
while IFS= read -r line
do
  CREATE_LINK_CMD="ln -sf $line"
  echo "${green}Created link:${reset} $CREATE_LINK_CMD"
done < "$input"

echo ""

# Brew install
if ! command -v brew &> /dev/null
then
  echo "> ${green}Installing brew${reset}"

  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  echo "${green}Brew already installed${reset}"
fi

echo ""

# Installing Brew apps
echo "> ${green}Installing brew apps${reset}"

brew bundle --file="apps/Brewfile"

echo ""

# Mac setup
echo "> ${green}Running mac setup${reset}"
./mac/mac-setup.sh

echo ""

echo "> ${yellow}Installation finished. Please, restart the shell.${reset}"