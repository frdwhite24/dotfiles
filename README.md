# dotfiles
Repo for all my configuration files so that setup in a new environment is quick and easy.

## Introduction

This repository uses the `git --bare` approach, resources I've used include:

- [Manage Dotfiles With a Bare Git Repo](https://harfangk.github.io/2016/09/18/manage-dotfiles-with-a-git-bare-repository.html)
- [Dotfile management by Atlassian](https://www.atlassian.com/git/tutorials/dotfiles)
- [Git Bare Repo by DistroTube](https://www.youtube.com/watch?v=tBoLDpTWVOM&ab_channel=DistroTube)

## Prerequisites

> Note: Ensure you've installed all LSs for Vim to properly function.

The list below outlines the packages I have installed on my laptop, additional to the original distro.

**GUI packages**

- brave-browser
- google-chrome-stable
- microsoft-edge-beta
- firefox
- slack
- discord
- transmission (torrent downloader)
- aegisub (subtitle file editor)
- typora (Markdown editor)
- peek (Screen recorder)
- gimp (Photo editor)
- vlc (Video media player)

**CLI packages**

- zsh
- Oh-my-zsh (ZSH config management framework)
- neovim
- git-delta (Better git diffs)
- bat (Better cat)
- fd-find (Better find)
- fzf (Fuzzy file finder)
- ripgrep (Recursive directory search for Regex pattern)
- tmux (Easy terminal sessions and windows)
- nordvpn (VPN cli)
- nvm (Node version manager)
- poetry (Python environment manager)

## Installing dotfiles to other systems

```sh
# STEP ONE: Create a dotman alias, and add dotfiles to a .gitignore in home
echo 'alias dotman="/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"' >> $HOME/.zshrc
source ~/.zshrc
echo "dotfiles" >> ~/.gitignore

# STEP TWO: Clone the repo
git clone --bare git@github.com:frdwhite24/dotfiles.git $HOME/dotfiles

# STEP THREE: Checkout and prevent untracked files from showing
# Note: checkout will fail if config files already exist.
dotman checkout
dotman config --local status.showUntrackedFiles no

# STEP FOUR: Add, update, delete the dotfiles
dotman status
dotman add .vimrc
dotman commit -m "add: vimrc"
dotman push
```

# Resources
- [Jltwheeler dotfiles](https://github.com/jltwheeler/dotfiles)
- [awesome dotfiles](https://github.com/webpro/awesome-dotfiles)
- [dwt1/dotfiles repo](https://gitlab.com/dwt1/dotfiles)
