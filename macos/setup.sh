#!/bin/bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew tap AdoptOpenJDK/openjdk

brew install \
    gcc \
    vim \
    haskell-stack \
    git \
    nodejs \
    shellcheck \
    tmux \
    fzf

brew cask install \
    google-chrome \
    iterm2 \
    jetbrains-toolbox \
    shiftit \
    nordvpn \
    caffeine \
    atom \
    adoptopenjdk11 \
    telegram-desktop \
    spotify \
    drawio \
    skim

npm i -g yarn

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git config --global user.name "Dmitriy Dubson"
git config --global user.email "d.dubson@gmail.com"

git config --global alias.gst git status
git config --global alias.st status
git config --global alias.di diff
git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.cp cherry-pick
git config --global alias.br branch
git config --global alias.sta stash
git config --global alias.llog "log --date=local"
git config --global alias.flog "log --pretty=fuller --decorate"
git config --global alias.lg "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
git config --global alias.lol "log --graph --decorate --oneline"
git config --global alias.lola "log --graph --decorate --oneline --all"
git config --global alias.blog "log origin/master... --left-right"
git config --global alias.ds "diff --staged"
git config --global alias.fixup "commit --fixup"
git config --global alias.squash "commit --squash"
git config --global alias.amendit "commit --amend --no-edit"
git config --global alias.unstage "reset HEAD"
git config --global alias.rum "rebase master@{u}"

brew doctor
brew cleanup
