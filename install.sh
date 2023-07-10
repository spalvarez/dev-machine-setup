#!/bin/bash
set -eo pipefail

PROJECT_DIR=$(dirname -- "${BASH_SOURCE[0]}")

xcode-select --install

if [[ "$(command -v brew)" ]]; then
  echo "Homebrew installed"
else
  echo "Installing homebrew"
  bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

brew bundle install --file="${PROJECT_DIR}/Brewfile"

brew tap snyk/tap
brew install snyk

# Gobrew
curl -sLk https://raw.githubusercontent.com/kevincobain2000/gobrew/master/git.io.sh | sh

sudo cp ${PROJECT_DIR}/.zshrc ${HOME}/.zshrc

source $HOME/.zshrc

gobrew use 1.18
tfenv use latest
