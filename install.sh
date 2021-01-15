#!/usr/bin/env bash

DOTFILES_DIR="${DOTFILES_DIR:-"$(cd "$(dirname "$0")" || exit; pwd -P)"}"

_install() {
  _install_oh_my_zsh
  _install_oh_my_zsh_theme
  _install_homebrew
  _install_homebrew_packages
  _link_files
}

_install_homebrew() {
  echo 'Installing Homebrew...'
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

_install_homebrew_packages() {
  echo 'Installing Homebrew packages...'
  brew update
  brew install ffmpeg gh htop node python tldr
}

_install_oh_my_zsh() {
  echo 'Installing Oh My Zsh...'
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  chsh -s "$(which zsh)"
}

_install_oh_my_zsh_theme() {
  echo 'Linking Oh My Zsh theme file...'
  ln -fs "$DOTFILES_DIR/.oh-my-zsh/custom/themes/main.zsh-theme" "$HOME/.oh-my-zsh/custom/themes"
}

_link_files() {
  echo 'Linking configuration files...'
  for file in $DOTFILES_DIR/.{aliases,exports,gitconfig,gitignore,npmignore,zshrc}; do
    ln -fs "$file" "$HOME"
  done;
}

case "$1" in
  install_homebrew) _install_homebrew;;
  install_homebrew_packages) _install_homebrew_packages;;
  install_oh_my_zsh) _install_oh_my_zsh;;
  install_oh_my_zsh_theme) _install_oh_my_zsh_theme;;
  link_files) _link_files;;
  *) _install;;
esac

echo 'Done.'
