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
      Model Identifier: MacBookPro16,1
      Processor Name: 6-Core Intel Core i7
      Processor Speed: 2,6 GHz
      Number of Processors: 1
      Total Number of Cores: 6
      L2 Cache (per Core): 256 KB
      L3 Cache: 12 MB
      Hyper-Threading Technology: Enabled
      Memory: 16 GB
      System Firmware Version: 1715.40.15.0.0 (iBridge: 19.16.10549.0.0,0)
      OS Loader Version: 540.40.4~45
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

### Brew install packages

```bash
brew bundle install
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
yadm clone https://github.com/stephan-weihrauch/dotfiles.git --bootstrap 
```

**NB:** Bootstraping updates the remote url to ssh, so an ssh key will have to be configured after this (see below).

**NB:** There might be some need to enter the sudo password.

**NB:** Mac App Store installs will ask for a login.

## Done

----

## Extra

### Add ssh key

Configure (new or existing) [ssh key and add it to GitHub](https://help.github.com/articles/connecting-to-github-with-ssh/), then [add key to ssh-agent and `~/.ssh/config`](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/#adding-your-ssh-key-to-the-ssh-agent). Then test:

```
ssh -T git@github.com
```

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
