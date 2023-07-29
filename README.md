```bash
  _    _______   ___   _____   _ _____    ____  ____  __________________    ___________
 | |  / /  _/ | / / | / /   | ( ) ___/   / __ \/ __ \/_  __/ ____/  _/ /   / ____/ ___/
 | | / // //  |/ /  |/ / /| | |/\__ \   / / / / / / / / / / /_   / // /   / __/  \__ \
 | |/ // // /|  / /|  / ___ |  ___/ /  / /_/ / /_/ / / / / __/ _/ // /___/ /___ ___/ /
 |___/___/_/ |_/_/ |_/_/  |_| /____/  /_____/\____/ /_/ /_/   /___/_____/_____//____/

```

## Table of Contents

- 👋 [Introduction](#-install-the-necessary-apps)
- 🛠️ [Application Installation](#%EF%B8%8F-application-installation)
- 🔐 [Private Configuration](#%EF%B8%8F-application-installation)
- 🔧 [OS X Default Settings](#-os-x-default-settings)
- 🔍 [Dotfiles Overview](#-dotfiles-overview)
- 💻 [Installation](#-installation)
- 🔒 [GPG Configuration](#-gpg-configuration)
- 🚀 [Changing Ulimit in macOS Sierra and Later](#-changing-ulimit-in-macos-sierra-and-later)
- 🎨 [PowerLevel10k In OhMyZsh](#-powerlevel10k-theme-in-ohmyzsh)
- ⚙️ [OhMyZsh Aditional Configs](#%EF%B8%8F-additional-ohmyzsh-configurations)


## 👋 Introduction
This repository combines the dotfiles of Paul Irish with the powerbook of Raúl Uranga. Its primary use is personal but feel free to suggest improvements or fork it!

## 🛠️ Application Installation

The base setup is performed in the `install.sh` script, which installs a variety of packages including brew (node, php, mongo, mysql, python, ruby), cask, some gems, npm global packages, and others.

## 🔐 Private Configuration

Store your private configurations in a file named `.extra` and avoid committing it to this repository. This file should be placed in your home directory (`~/`). Here's an example of how to set the PATH:

```shell

## PATH configuration
PATH=/opt/local/bin
PATH=$PATH:/opt/local/sbin
PATH=$PATH:/bin
PATH=$PATH:~/.rvm/bin
...

export PATH
```

## 🔧 OS X Default Settings

When setting up a new Mac, you may want to set some sensible OS X defaults. Run the following script to do this:

```bash
./.osx
```

Note that Homebrew's package installation path differs based on the Mac model:

```bash
# Intel Chip
/usr/local/Homebrew/bin/brew

# Apple Silicon (M1, M2)
/opt/homebrew/bin/brew
```

## 🔍 Dotfiles Overview

**Automatic Config**

- `.vimrc`, `.vim` - vim config, obv.
- `.ackrc`
- `.editorconfig`
- `.jshintrc`
- `.jscsrc`

**Shell Environment**

- .aliases
- .bash_profile
- .bash_prompt
- .bashrc
- .exports
- .functions
- .extra - Not included; refer to the **`Private Configuration`** section.

**Manual Run**

- `setup.sh` - Necessary apps.
- `.osx` - To be run on a fresh OS X machine.

**Git**

- `.gitattributes`
- `.gitconfig`
- `.gitignore`

**Bash Readline**

- `.inputrc` - Bash readline configuration.

## 💻 Installation

To install, clone this repository to your `home directory`, navigate to it, and run `setup.sh`:
```shell
git clone https://github.com/ViniciusVinna/dotfiles.git ~/.dotfiles && cd ~/.dotfiles && ./setup.sh
```

You can also install specific modules individually:

```bash
./setup.sh module_name
```

Available modules: apps, brew, dotfiles, fonts, npm, quicklook, and rubygems.
To update later on, simply re-run the installation script.

## 🔒 GPG Configuration

To set your pinentry program, add the following to your `~/.gnupg/gpg-agent.conf`

```bash
pinentry-program $(brew --prefix)/bin/pinentry-mac
```

Follow these guides for further details:
- [Methods of Signing with a GPG Key on MacOS](https://gist.github.com/troyfontaine/18c9146295168ee9ca2b30c00bd1b41e)
- [Github Email](https://github.com/settings/emails)

## 🚀 Changing Ulimit in macOS Sierra and Later
To change the ulimit on Mac OS X 10.12 and later, run the following commands:

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

## 🎨 PowerLevel10k Theme in OhMyZsh

To use the **PowerLevel10k** theme in **OhMyZsh**, clone the repository and set it as the `ZSH_THEME` in `~/.zshrc`:

```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```
To run the PowerLevel10k configuration wizard, enter the following command in your terminal:

Set `ZSH_THEME="powerlevel10k/powerlevel10k"` in `~/.zshrc`.

To run the PowerLevel10k configuration wizard, enter the following command in your terminal:

```bash
p10k configure
```

## ⚙️ Additional OhMyZsh Configurations
You can also add additional configurations for `OhMyZsh`:

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

## ⚙️ NPM Global Packages Overview



| :--: | :--: | ------- | --------------- |
| Index | Emoji | Package Name | Description |
| :--: | :--: | ------- | --------------- |
| 1 | :package: | `@types/node` | TypeScript definitions for Node.js |
| 2 | :cloud: | `aws-sdk` | AWS SDK for JavaScript in Node.js |
| 3 | :key: | `aws4` | Signs and prepares requests using AWS Signature Version 4 |
| 4 | :heavy_check_mark: | `bundle-phobia-cli` | CLI tool to find out the cost of adding a new npm package to your bundle |
| 5 | :mag_right: | `check-side-effects` | Checks if your code has side-effects |
| 6 | :computer: | `codesandbox` | Online code editor tailored for web applications |
| 7 | :bridge_at_night: | `corepack` | Zero-runtime-dependency package acting as bridge between Node projects and their package managers |
| 8 | :rocket: | `create-next-app` | Create Next.js apps in one command |
| 9 | :detective: | `depcheck` | Check your npm module for unused dependencies |
| 10 | :ferris_wheel: | `expo-cli` | Command line environment for Expo |
| 11 | :fire: | `firebase-tools` | Firebase CLI provides a variety of tools for managing, viewing, and deploying to Firebase projects |
| 12 | :book: | `gitbook-cli` | CLI to create books using GitBook |
| 13 | :link: | `graphqurl` | curl for GraphQL with autocomplete, subscriptions and GraphiQL |
| 14 | :runner: | `hopa` | Lightweight and easy-to-use runtime for JavaScript and TypeScript |
| 15 | :globe_with_meridians: | `iectrl` | A CLI for Internet Explorer Virtual Machines |
| 16 | :wrench: | `jscodeshift` | Toolkit for running large-scale JavaScript codemods |
| 17 | :page_facing_up: | `json` | A 'json' command for massaging JSON on your Unix command line |
| 18 | :house_with_garden: | `netlify-cli` | Netlify Command Line Interface |
| 19 | :recycle: | `node-dev` | Zero-configuration developer tool for Node.js that automatically restarts the node process when a file is modified |
| 20 | :eyes: | `nodemon` | Tool that helps develop node.js based applications by automatically restarting the node application when file changes in the directory are detected |
| 21 | :up: | `np` | A better `npm publish` |
| 22 | :arrows_counterclockwise: | `npm-check-updates` | This module helps you to find newer versions of dependencies than what your package.json or bower.json allows |
| 23 | :thinking_face: | `npm-consider` | Helps you to choose which NPM package to use by showing you bundle size and download count statistics |
| 24 | :link: | `npm-link-up` | This tool helps to create links between local projects |
| 25 | :clipboard: | `ntl` | Interactive cli menu to list and run package.json scripts |
| 26 | :package: | `package-size` | Determine the size of a package before adding it to your bundle |
| 27 | :robot: | `pm2` | Production process manager for Node.js apps with a built-in load balancer |
| 28 | :paintbrush: | `prettier` | An opinionated code formatter |
| 29 | :tada: | `release` | Generate a new GitHub Release with automated binary attachment and release notes from your recent commits |
| 30 | :fast_forward: | `serve` | Static file serving and directory listing |
| 31 | :cloud: | `serverless` | The Serverless Framework – Build web, mobile and IoT applications with serverless architectures |
| 32 | :world_map: | `source-map-explorer` | Analyze and debug space usage through source maps |
| 33 | :wave: | `surge` | Simple, single command web publishing. Publish HTML, CSS, and JS for free, without leaving the command line |
| 34 | :art: | `svgo` | Node.js tool for optimizing SVG files |
| 35 | :bookmark_tabs: | `tldr` | Simplified and community-driven man pages |
| 36 | :shell: | `ts-node` | TypeScript execution and REPL for Node.js |
| 37 | :deciduous_tree: | `tsm` | Tree shaking your css modules |
| 38 | :high_brightness: | `tsx` | An advanced, feature-rich TypeScript syntax highlighter |
| 39 | :writing_hand: | `typescript` | TypeScript is a language for application-scale JavaScript development |
| 40 | :id: | `uuid` | Simple, fast generation of RFC4122 UUIDS |
| 41 | :rocket: | `vercel` | CLI for Vercel and the Now platform |
| 42 | :chart_with_upwards_trend: | `webpack-bundle-analyzer` | Plugin and CLI utility that represents bundle content as a convenient interactive zoomable treemap |

