#!/usr/bin/env bash

set -o errexit
set -o errtrace
set -o nounset
set -o pipefail

function brew_install() {
  echo "⭐️ checking for $1..."
  if [[ -z `brew list --versions $1` ]]; then
    echo "Installing $1"
    brew install $1
  else
    echo "$1 already installed"
  fi
}

function brew_install_cask() {
  echo "⭐️ checking for $1..."
  if [[ -z `brew list --cask --versions $1` ]]; then
    echo "Installing $1"
    brew install --cask $1
  else
    echo "$1 already installed"
  fi
}

function developer_setup() {

  echo "⭐️ checking for xcode"
  if [[ ! -x /usr/bin/gcc ]]; then
    echo "Info | Install | xcode cli tools"
    xcode-select --install
  else
    echo "xcode is already installed"
  fi

  echo "⭐️ checking for homebrew..."
  if ! command -v brew &> /dev/null ; then
    echo "⚠️  brew could not be found"
    echo "Installing homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo '# Set PATH, MANPATH, etc., for Homebrew.' >> /Users/rxvallejoc/.zprofile
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/rxvallejoc/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
  else
    echo "Homebrew already installed"
  fi

  brew_install "zsh"
  brew_install "git"
  brew_install "direnv"
  brew_install "bash-completion"
  brew_install "zsh-autosuggestions"
  brew_install "fzf"
  brew_install "tmux"
  brew_install "kubectl"
  brew_install "kubectx"
  brew_install "awscli"
  brew_install "kcat"
  brew_install "watch"
  brew_install "nvm"
  brew_install "jq"
  brew_install "docker"
  brew_install "colima"
  brew_install "antigen"
  
  brew_install_cask "iterm2"
  brew_install_cask "macvim"
  brew_install_cask "visual-studio-code"
  brew_install_cask "google-chrome"
  brew_install_cask "firefox"
  brew_install_cask "firefox-developer-edition"
  brew_install_cask "dbeaver-community"
  brew_install_cask "lens"
  brew_install_cask "postman"
  brew_install_cask "1password/tap/1password-cli"


  echo "⭐️ checking for font-hack-nerd-font..."
  if [[ -z `brew list --cask --versions font-hack-nerd-font` ]]; then
    echo "Installing font-hack-nerd-font"
    brew tap homebrew/cask-fonts
    brew install --cask font-hack-nerd-font
  else
    echo "font-hack-nerd-font already installed"
  fi
  
}

developer_setup
