# Roger Gros Dotfiles

👏 Based on [Codelytv dotfiles](https://github.com/CodelyTV/dotfiles)

## Installation

### 💻 On your mac
```shell
git clone git@github.com:CodelyTV/dotfiles.git ~/
```

### 🛠 Install requirements
```shell
# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install zsh
curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
```

### 🎯 Symlinks
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
brew bundle --file="~/.dotfiles/apps/Brewfile"
```

### 🔧 Other
```shell
# Ensure that Jump script has file for database
touch ~/.z
```

## 📦 Backup apps

Generate brew backup
```shell
# Generated as tmp to diff and take only what you want
brew bundle dump --file="~/.dotfiles/apps/Brewfile.tmp" --force
```

## 💪 Thanks

Thanks to [Codelytv](https://codely.tv) for the idea & help 😃

## Resources

- [codelytv/dotfiles](https://github.com/CodelyTV/dotfiles)
- [codelytv/dotly](https://github.com/CodelyTV/dotly)


