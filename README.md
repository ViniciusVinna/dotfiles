```bash
  _    _______   ___   _____   _ _____    ____  ____  __________________    ___________
 | |  / /  _/ | / / | / /   | ( ) ___/   / __ \/ __ \/_  __/ ____/  _/ /   / ____/ ___/
 | | / // //  |/ /  |/ / /| | |/\__ \   / / / / / / / / / / /_   / // /   / __/  \__ \
 | |/ // // /|  / /|  / ___ |  ___/ /  / /_/ / /_/ / / / / __/ _/ // /___/ /___ ___/ /
 |___/___/_/ |_/_/ |_/_/  |_| /____/  /_____/\____/ /_/ /_/   /___/_____/_____//____/

```

## Table of Contents

- 🛠️ [Install the Necessary Apps](#install-the-necessary-apps)
- 🔐 [Private Config](#private-config)
- 🔧 [Sensible OS X Defaults](#sensible-os-x-defaults)
- 🔍 [Overview of Dotfiles](#overview-of-dotfiles)
- 💻 [Installation](#installation)
- 🔒 [Configure GPG](#configure-gpg)
- 🚀 [Changing ulimit on Mac OS X 10.12 and Up](#changing-ulimit-on-mac-os-x-1012-and-up)

This repository is a mashup between Paul Irish's dotfiles and Raúl Uranga's powerbook.
Mostly, it's for personal use, but you're welcome to make suggestions and fork it!

## 🛠️ Install the Necessary Apps

The basic setup is executed in install.sh, which adds a ton of stuff: brew (node, php, mongo, mysql, python, ruby), cask, some gems, npm global packages, and more.

## 🔐 Private Config

Toss your private configurations into a file called .extra and don't commit it to this repository. Just keep it in your ~/.

```shell

## PATH like a boss
PATH=/opt/local/bin
PATH=$PATH:/opt/local/sbin
PATH=$PATH:/bin
PATH=$PATH:~/.rvm/bin
...

export PATH
```

## 🔧 Sensible OS X Defaults

When setting up a new Mac, you may want to set some sensible OS X defaults:

```bash
./.osx
```

Homebrew made some changes to where it installs packages if you are running it on a new M1 Mac

```bash
# Intel Chip
/usr/local/Homebrew/bin/brew

# Apple Silicon (M1, M2)
/opt/homebrew/bin/brew
```

## 🔍 Overview of Dotfiles

Automatic Config

- `.vimrc`, `.vim` - vim config, obv.
- `.ackrc`
- `.editorconfig`
- `.jshintrc`
- `.jscsrc`

Shell Environment

- .aliases
- .bash_profile
- .bash_prompt
- .bashrc
- .exports
- .functions
- .extra - not included, explained above

Manual Run

- `setup.sh` - apps I need
- `.osx` - run on a fresh OS X machine

Git

- `.gitattributes`
- `.gitconfig`
- `.gitignore`

Bash Readline

- `.inputrc` - config for bash readline

## 💻 Installation

```bash
git clone https://github.com/ViniciusVinna/dotfiles.git ~/.dotfiles && cd ~/.dotfiles && ./setup.sh
```

You can also install the modules individually:

```bash
./setup.sh module_name
```

Modules available: apps, brew, dotfiles, fonts, npm, quicklook, and rubygems.

To update later on, just run the installation again.

## 🔒 Configure GPG

Set your pinentry program by adding it to `~/.gnupg/gpg-agent.conf`

```bash
pinentry-program $(brew --prefix)/bin/pinentry-mac
```

## 🚀 Changing ulimit on Mac OS X 10.12 and Up

```bash
sudo /usr/libexec/PlistBuddy /Library/LaunchAgents/com.launchd.maxfiles.plist \
-c "add Label string com.launchd.maxfiles" \
-c "add ProgramArguments array" \
-c "add ProgramArguments: string launchctl" \
-c "add ProgramArguments: string limit" \
-c "add ProgramArguments: string maxfiles" \
-c "add ProgramArguments: string 20000" \
-c "add ProgramArguments: string unlimited" \
-c "add RunAtLoad bool true"

sudo /usr/libexec/PlistBuddy /Library/LaunchAgents/com.launchd.maxproc.plist \
-c "add Label string com.launchd.maxproc" \
-c "add ProgramArguments array" \
-c "add ProgramArguments: string launchctl" \
-c "add ProgramArguments: string limit" \
-c "add ProgramArguments: string maxproc" \
-c "add ProgramArguments: string 2048" \
-c "add ProgramArguments: string unlimited" \
-c "add RunAtLoad bool true"
```

## Powerlevel10k Oh My Zsh

Clone the repository:

```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

Set `ZSH_THEME="powerlevel10k/powerlevel10k"` in `~/.zshrc`.

Configuration Wizard

On Your terminal type:

```bash
p10k configure
```

## OHMYZSH

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

Using GPG:

[Methods of Signing with a GPG Key on MacOS](https://gist.github.com/troyfontaine/18c9146295168ee9ca2b30c00bd1b41e)
