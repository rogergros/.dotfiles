# ⚫️ .dotfiles

## 📓 Table of contents

- [ℹ️ About](#ℹ%EF%B8%8F-about)
- [🗜 Installation](#-installation)
    * [💻 On your mac](#-on-your-mac)
    * [🤖 Automatic setup](#-automatic-setup)
    * [✍️ Manual setup](#%EF%B8%8F-manual-setup)
        + [🛠 Install requirements](#-install-requirements)
        + [🎯 Symlinks](#-symlinks)
        + [🔧 Other](#-other)
- [📦 Backup apps](#-backup-apps)
- [📎 Forking](#-forking)
- [💪 Thanks to](#-thanks-to)

## ℹ️ About

This .dotfiles project helps you back up, maintain and restore the basic setups and applications on your 🖥 Mac.

Right now can keep:
* Some Mac osx configuration
* Brew installed apps (Binaries and cask)
* Zsh config and utilities
* Git config

## 🗜 Installation

### 💻 On your mac
```shell
git clone https://github.com/rogergros/.dotfiles.git ~
```

### 🤖 Automatic setup
```shell
./setup.sh

# In a mac
./setup_mac.sh
```

### ✍️ Manual setup

#### 🛠 Install requirements
```shell
# Install Zim framework for ZSH
curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh

# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
```

#### 🎯 Symlinks
Create symlinks for zsh
```shell
ln -s ~/.dotfiles/shell/zsh/.zimrc ~/.zimrc
ln -s ~/.dotfiles/shell/zsh/.zlogin ~/.zlogin
ln -s ~/.dotfiles/shell/zsh/.zshenv ~/.zshenv
ln -s ~/.dotfiles/shell/zsh/.zshrc ~/.zshrc
```

Create symlinks for git
```shell
ln -s ~/.dotfiles/git/.gitattributes ~/.gitattributes
ln -s ~/.dotfiles/git/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/git/.gitignore_global ~/.gitignore_global
```

Install brew apps
```shell
brew bundle --file="~/.dotfiles/mac/Brewfile"
```

#### 🔧 Other
```shell
# Ensure that Jump script has file for database
touch ~/.z
```

## 📦 Backup apps

Generate brew backup
```shell
# Generated as tmp to diff and take only what you want
brew bundle dump --file="~/.dotfiles/mac/Brewfile.tmp" --force
```

## 🥸 Custom files

Some times you want to add customizations that you don't want to version.
Let's say that you use that at work and you want to keep some environment variables.
This dotfiles look for specific custom files:
* `~/.zshenv_custom` → For custom environment variables


## 📎 Forking

If you want to fork this repository remember to change:
* `git/.gitconfig` → The git config name and email
* `mac/mac-setup.sh` → Change the desired mac setup values
* `apps/Brewfile` → The mac installed apps

## 💪 Thanks to

* [Codelytv](https://codely.tv) for the idea, course and [dotfiles](https://github.com/CodelyTV/dotfiles) and [dotly](https://github.com/CodelyTV/dotly) repositories
* Mathias Bynens ([@mathias](https://twitter.com/mathias)) for his [dotfiles repository](https://github.com/mathiasbynens/dotfiles)
* Gracjan ([@gracjankn](https://twitter.com/gracjankn)) for his [dotfiles repository](https://github.com/gracjankn/dotfiles)


