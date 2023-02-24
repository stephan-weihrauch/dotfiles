# My Dotfiles

![dotfiles](https://dotfiles.github.io/images/dotfiles-logo.png)

Hi! These are my dotfiles that I use every day. If you find something
interesting, go ahead and take whatever you want from my dotfiles.

It is managed using [yadm](https://github.com/TheLocehiliosan/yadm/), a dotfile
manager. This makes it simple to set up a new computer with these files. In
order to set up a new system with these dotfiles, do the following:

## Hardware

As my main device i use Macbook Pro 2019

$ system_profiler SPHardwareDataType | grep -v "UDID\|UUID\|Serial" | pbcopy

    Hardware Overview:

      Model Name: MacBook Pro
      Model Identifier: MacBookPro18,1
      Model Number: Z14V0005MD/A
      Chip: Apple M1 Pro
      Total Number of Cores: 10 (8 performance and 2 efficiency)
      Memory: 32 GB
      System Firmware Version: 8419.80.7
      OS Loader Version: 8419.80.7
      Serial Number (system): WCWT9D40FL
      Hardware UUID: 39978B43-B3D3-57DE-81A2-EC7E24A3BA0F
      Provisioning UDID: 00006000-001250110123801E
      Activation Lock Status: Disabled



# macOS setup

## Pre-setup

### Install `homebrew`

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

```bash
sudo chown -R $(whoami) /usr/local/share/zsh /usr/local/share/zsh/site-functions
```

### Disable Gatekeeper on macOS 

```bash
sudo spctl --master-disable
```

### Install `yadm`

```bash
brew install yadm
```


### Mac show hidden files
```bash
defaults write com.apple.Finder AppleShowAllFiles true

killall Finder
```

### Log into the Mac App Store

(for `mas`) via `App Store > Preferences > Sign in`

## Setup

### Clone and bootstrap

```bash
yadm clone git@github.com-stephan-weihrauch:stephan-weihrauch/dotfiles.git 
```


### When there is an error try Brew install packages and then repeat yadm clone

```bash
brew bundle install
```


## Done

----



### Cheat sheet

```bash
# yadm wraps git, e.g.:
yadm status
yadm add <file>
yadm commit
yadm push
# etc

# List files under yadm control:
yadm list -a
```

See: <https://yadm.io/docs/common_commands>
