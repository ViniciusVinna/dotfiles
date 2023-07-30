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
- ⚙️ [OhMyZsh Aditional Configs](#%EF%B8%8F-additional-ohmyzsh-configurations)
- 🫣 [Packages: Sneak peek]()
  - 🍺 [`Brewfile` Package List]()
  - 📦 [`NPMfile` Package List]()


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

## 🫣 Packages: Sneak peek

#### 🍺 `Brewfile` Package List
<details>
  <summary>Brew Commands: Installing CLI Tools and Utilities</summary>

> - 🍺 `ack`: Search tool, optimized for programmers.
> - 🍺 `awscli`: AWS Command Line Interface.
> - 🍺 `bash`: Latest version of Bash.
> - 🍺 `bash-completion@2`: Bash completion for Homebrew formulae.
> - 🍺 `bat`: Cat(1) clone with syntax highlighting and Git integration.
> - 🍺 `gettext`: GNU internationalization (i18n) and localization (l10n) library.
> - 🍺 `bfg`: Remove large files or passwords from Git history.
> - 🍺 `brew-cask-completion`: Bash completion for Homebrew Cask.
> - 🍺 `caddy`: Fast and easy-to-use web server with automatic HTTPS.
> - 🍺 `certbot`: Tool to obtain and renew Let's Encrypt SSL certificates.
> - 🍺 `cheat`: Create and view interactive cheatsheets on the command-line.
> - 🍺 `oniguruma`: Regular expressions library.
> - 🍺 `coreutils`: GNU core utilities (prefixed with 'g' by default).
> - 🍺 `direnv`: Environment switcher for the shell.
> - 🍺 `duf`: Disk Usage/Free Utility - a more modern 'df' alternative.
> - 🍺 `dust`: More intuitive version of 'du' (disk usage).
> - 🍺 `espanso`: Text expander written in Rust.
> - 🍺 `findutils`: Collection of GNU find, xargs, and locate.
> - 🍺 `fnm`: Node.js version manager.
> - 🍺 `fzf`: Command-line fuzzy finder.
> - 🍺 `gem-completion`: Bash completion for RubyGems.
> - 🍺 `gh`: GitHub CLI.
> - 🍺 `git`: Distributed version control system.
> - 🍺 `git-delta`: Syntax-highlighting pager for Git.
> - 🍺 `git-extras`: Extra git commands.
> - 🍺 `git-filter-repo`: Rewrite repositories to modernize history and more.
> - 🍺 `git-lfs`: Git extension for versioning large files.
> - 🍺 `gnupg`: GNU Pretty Good Privacy (PGP) package.
> - 🍺 `gnupg2`: GNU Pretty Good Privacy (PGP) package.
> - 🍺 `gping`: Ping, but with a graph.
> - 🍺 `grep`: GNU grep, egrep, and fgrep.
> - 🍺 `htmlq`: Command-line HTML processor.
> - 🍺 `htop`: Improved top (interactive process viewer).
> - 🍺 `httpd`: Apache HTTP Server.
> - 🍺 `httpie`: HTTP client for the command line.
> - 🍺 `hub`: GitHub command-line tools.
> - 🍺 `ievms`: Automated installation of Microsoft IE AppCompat VMs.
> - 🍺 `python@3.9`: Latest Python 3.9 version.
> - 🍺 `libheif`: HEIF file format decoder and encoder.
> - 🍺 `imagemagick`: Image processing tools and libraries.
> - 🍺 `jq`: Command-line JSON processor.
> - 🍺 `lame`: High-quality MPEG audio layer III (MP3) encoder.
> - 🍺 `launchctl-completion`: Bash completion for launchctl.
> - 🍺 `libyaml`: YAML parser and emitter library.
> - 🍺 `mariadb`: MariaDB database server.
> - 🍺 `mas`: Mac App Store command-line interface.
> - 🍺 `miller`: Like awk, sed, cut, join, and sort for name-indexed data.
> - 🍺 `mkcert`: Create locally-trusted development certificates.
> - 🍺 `mongosh`: MongoDB shell with enhancements.
> - 🍺 `mongodb/brew/mongodb-community`: MongoDB Community Edition.
> - 🍺 `nginx`: Web server.
> - 🍺 `ngrep`: Network grep.
> - 🍺 `nss`: Mozilla Network Security Services.
> - 🍺 `openssl@3`: Cryptography and SSL/TLS Toolkit (version 3.x).
> - 🍺 `pinentry-mac`: Simple PIN-entry dialog for GnuPG.
> - 🍺 `procs`: Top-like utility for monitoring processes.
> - 🍺 `pyenv-virtualenv`: Python version management.
> - 🍺 `rbenv`: Ruby version management.
> - 🍺 `rename`: Perl-powered file rename script.
> - 🍺 `ripgrep`: Line-oriented search tool.
> - 🍺 `screen`: Terminal multiplexer.
> - 🍺 `sd`: Intuitive find & replace CLI.
> - 🍺 `speedtest-cli`: Command-line interface for testing internet bandwidth.
> - 🍺 `packer`: Tool to build, change, and version infrastructure.
> - 🍺 `terraform`: Tool to build, change, and version infrastructure.
> - 🍺 `thefuck`: Magnificent app that corrects your previous console command.
> - 🍺 `tree`: Display directory tree, in color.
> - 🍺 `tig`: Text-mode interface for Git repositories.
> - 🍺 `vim`: Improved version of the standard Unix text editor.
> - 🍺 `volta`: JavaScript tool manager.
> - 🍺 `watchman`: File system watcher.
> - 🍺 `tldr`: Simplified and community-driven man pages.
> - 🍺 `wget`: Internet file retriever.
> - 🍺 `yarn`: Fast, reliable, and secure dependency management.
> - 🍺 `yarn-completion`: Bash completion for Yarn.
> - 🍺 `yt-dlp`: YouTube-DL fork with additional features and fixes.
> - 🍺 `zoxide`: Fast, flexible directory jumper.
</details>


<details>
  <summary>Brew Commands: Programming Languages and Development Tools</summary>

> - 🍺 `clojure`: Clojure programming language, a dynamic, general-purpose language, combining the approachability and interactive development of a scripting language with an efficient and robust infrastructure for multithreaded programming.
> - 🍺 `elixir`: Elixir programming language, a dynamic, functional language designed for building scalable and maintainable applications, leveraging the Erlang VM, known for running low-latency, distributed, and fault-tolerant systems.
> - 🍺 `ruby`: Ruby programming language.
> - 🍺 `lua`: Lua programming language.
> - 🍺 `node`: Node.js JavaScript runtime.
> - 🍺 `go`: Go programming language.
> - 🍺 `typescript`: Language for application-scale JavaScript development.
> - 🍺 `rust`: Rust programming language.
> - 🍺 `php`: Latest PHP version.
> - 🍺 `python`: Latest Python version.
> - 🍺 `deno`: Secure runtime for JavaScript and TypeScript.
> - 🍺 `composer`: Dependency Manager for PHP.
> - 🍺 `wp-cli`: Command-line interface for WordPress.
> - 🍺 `mongosh`: MongoDB Shell: An interactive JavaScript interface to MongoDB, enabling you to query and update data as well as perform administrative operations.
> - 🍺 `elixir-ls`: Elixir language server: An implementation of Microsoft's Language Server Protocol for the Elixir programming language, providing features like auto-completion, go to definition, and error checking to editors that support it.
> - 🍺 `mongodb/brew/mongodb-community`: MongoDB Community Edition.
> - 🍺 `mariadb`: Drop-in replacement for MySQL.
</details>


<details>
  <summary>Cask Commands: Installing GUI Applications</summary>

> - 🍺 `iterm2`: Terminal emulator.
> - 🍺 `postman`: Collaboration platform for API development.
> - 🍺 `insomnia`: HTTP and GraphQL Client.
> - 🍺 `little-snitch`: Host-based application firewall.
> - 🍺 `tower`: Git client focusing on power and productivity.
> - 🍺 `robo-3t`: MongoDB management tool.
> - 🍺 `postgresql`: Object-relational database system.
> - 🍺 `anaconda`: Distribution of the Python and R programming languages for scientific computing.
> - 🍺 `sequel-pro`: MySQL/MariaDB database management platform.
> - 🍺 `mysqlworkbench`: Visual tool to design, develop, and administer MySQL servers.
> - 🍺 `robo-3t`: MongoDB management tool.
> - 🍺 `arduino`: Electronics prototyping platform.
> - 🍺 `visual-studio-code`: Open-source code editor.
> - 🍺 `lastpass`: Password manager.
</details>

<details>
  <summary>Browsers</summary>

> - 🍺 `chromium`: Chromium: An open-source web browser project from which Google Chrome draws its source code.
> - 🍺 `microsoft-edge`: Microsoft Edge: Microsoft's fast, secure, and modern web browser built on the open-source Chromium project.
> - 🍺 `firefox`: Firefox: Mozilla's popular open-source web browser known for its speed, lightness, and add-on community.
> - 🍺 `firefox-developer-edition`: Firefox Developer Edition: Offers the latest features and tools you need to build for the open web; includes experimental features such as the Multi-line Console Editor and WebSocket Inspector.
> - 🍺 `google-chrome`: Google Chrome: Google's web browser, known for its speed and simplicity.
</details>

<details>
  <summary>Communication</summary>

> - 🍺 `discord`: Discord: All-in-one voice, video, and text chat for gamers that's free, secure, and works on both your desktop and phone.
> - 🍺 `slack`: Slack: A collaboration hub.
> - 🍺 `gather`: Gather: A gamified collaboration hub.
> - 🍺 `fig`: Fig is a command-line utility designed to enhance and improve the user experience when working with the terminal.
> - 🍺 `github`: Git GUI.
> - 🍺 `staruml`: Software modeler.
> - 🍺 `xampp`: Apache distribution containing MySQL, PHP, and Perl.
> - 🍺 `synergy-core`: Synergy, the keyboard and mouse sharing tool.
> - 🍺 `shuttle`: Simple shortcut menu.
> - 🍺 `alfred`: Application launcher and productivity software.
> - 🍺 `browserstacklocal`: Test localhost and staging websites.
> - 🍺 `authy`: Two-factor authentication software.
> - 🍺 `cyberduck`: Server and cloud storage browser.
> - 🍺 `qlcolorcode`: QuickLook plug-in that renders source code with syntax highlighting.
> - 🍺 `gettext`: GNU internationalization (i18n) and localization (l10n) library.
> - 🍺 `graphql-playground`: GraphQL IDE for better development workflows.
> - 🍺 `imageoptim`: Tool to optimize images to a smaller size.
> - 🍺 `jetbrains-toolbox`: JetBrains tools manager.
> - 🍺 `kindle`: Interface for reading and syncing eBooks.
> - 🍺 `notion`: App to write, plan, collaborate, and get organized.
> - 🍺 `pixelsnap`: Screen measuring tool.
</details>


<details>
  <summary>Color Pickers</summary>

> - 🍺 `colorpicker-materialdesign`: Material Design Color Picker: A color picker built by Google that helps you choose colors according to Material Design guidelines.
> - 🍺 `colorpicker-propicker`: Propicker: A macOS color picker app that provides many different ways to pick color and copy it directly into the clipboard.
> - 🍺 `colorpicker-skalacolor`: Skala Color: A compact and feature-rich macOS color picker that works with a huge variety of formats, covering everything you’re likely to need for web, iOS, Android, and macOS development.
</details>


<details>
  <summary>QuickLook Plugins</summary>

> - 🍺 `qlimagesize`: Display image info and preview unsupported formats in QuickLook.
> - 🍺 `qlmarkdown`: QuickLook generator for Markdown files.
> - 🍺 `qlprettypatch`: QLPrettyPatch.
> - 🍺 `quicklook-csv`: QuickLook plugin for CSV files.
> - 🍺 `quicklook-json`: QuickLook plugin for JSON files.
</details>

<details>
  <summary>Productivity</summary>

> - 🍺 `raycast`: Control your tools with a few keystrokes.
> - 🍺 `suspicious-package`: Suspicious Package: An application that allows you to inspect the contents of a macOS Installer package (.pkg) before you install it to ensure it doesn't contain anything unexpected or malicious.
> - 🍺 `swiftbar`: Menu bar customization tool.
> - 🍺 `taskade`: Task manager for teams.
> - 🍺 `the-unarchiver`: Unpacks archive files.
> - 🍺 `vanilla`: Tool to hide menu bar icons.
</details>

<details>
  <summary>Creative Software</summary>

> - 🍺 `adobe-creative-cloud`: Collection of apps and services for photography, design, video, web, and UX.

</details>

<details>
  <summary>Typography</summary>

> - 🍺 `font-dejavu-sans-mono-for-powerline`: DejaVu Sans Mono font with Powerline support.
> - 🍺 `font-fira-code-nerd-font`: Fira Code Nerd Font.
> - 🍺 `font-inconsolata`: Inconsolata font.
> - 🍺 `font-inconsolata-dz-for-powerline`: Inconsolata Dz font with Powerline support.
> - 🍺 `font-inconsolata-for-powerline`: Inconsolata font with Powerline support.
> - 🍺 `font-jetbrains-mono`: JetBrains Mono font.
> - 🍺 `font-jetbrains-mono-nerd-font`: JetBrains Mono Nerd Font.
> - 🍺 `font-source-code-pro`: Source Code Pro font.
> - 🍺 `font-source-code-pro-for-powerline`: Source Code Pro font with Powerline support.
> - 🍺 `font-ubuntu`: Ubuntu font.
</details>

#### 📦 `NPMfile` Package List

<details>
  <summary>Packages</summary>

> - 📦 **@types/node**: TypeScript definitions for Node.js.
> - 📦 **aws-sdk**: AWS SDK for JavaScript.
> - 📦 **aws4**: Sign AWS requests with signature version 4.
> - 📦 **bundle-phobia-cli**: Check the size of an NPM package before installing it.
> - 📦 **check-side-effects**: Detect side effects in JavaScript modules.
> - 📦 **codesandbox**: Online code editor tailored for web application development.
> - 📦 **corepack**: Zero-configuration JavaScript monorepo and workspace manager.
> - 📦 **create-next-app**: Create a new Next.js app.
> - 📦 **depcheck**: Check for unused dependencies.
> - 📦 **expo-cli**: Command-line interface for Expo, a framework for building universal applications.
> - 📦 **firebase-tools**: CLI to interact with Firebase services.
> - 📦 **gitbook-cli**: Create and publish beautiful books using Git and Markdown.
> - 📦 **graphqurl**: cURL for GraphQL, a command-line tool for making GraphQL queries.
> - 📦 **hopa**: Simplified HTTP requests using promises.
> - 📦 **iectrl**: Interact with Internet Explorer instances programmatically.
> - 📦 **jscodeshift**: Toolkit for running codemods over multiple JavaScript files.
> - 📦 **json**: JSON command-line tool.
> - 📦 **netlify-cli**: Command-line interface for Netlify, a web hosting and serverless backend service.
> - 📦 **node-dev**: Monitor and restart a Node.js application on file changes.
> - 📦 **nodemon**: Monitor and automatically restart a Node.js application on file changes.
> - 📦 **np**: Better npm publish.
> - 📦 **npm-check-updates**: Check for updates of npm packages.
> - 📦 **npm-consider**: Analyze dependencies in npm projects.
> - 📦 **npm-link-up**: Interactive npm link.
> - 📦 **ntl**: Interactive CLI for running npm scripts.
> - 📦 **package-size**: Display the size of an npm package.
> - 📦 **pm2**: Advanced process manager for Node.js applications.
> - 📦 **prettier**: Opinionated code formatter.
> - 📦 **release**: Automate versioning and changelog generation.
> - 📦 **serve**: Static file server.
> - 📦 **serverless**: Framework for building serverless applications.
> - 📦 **source-map-explorer**: Analyze and visualize the size of JavaScript bundles.
> - 📦 **surge**: Static web publishing for Front-End Developers.
> - 📦 **svgo**: Node.js tool for optimizing SVG files.
> - 📦 **tldr**: Simplified and community-driven man pages.
> - 📦 **ts-node**: TypeScript execution and REPL for Node.js.
> - 📦 **tsm**: Simple and fast module bundler for TypeScript projects.
> - 📦 **tsx**: TypeScript transformer for JSX syntax.
> - 📦 **typescript**: TypeScript language.
> - 📦 **uuid**: Generate RFC-compliant UUIDs.
> - 📦 **vercel**: Deploy websites and web apps with ease.
> - 📦 **webpack-bundle-analyzer**: Visualize the size of webpack output files.
</details>