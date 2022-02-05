#!/usr/bin/env bash

DOTFILES_DIR="${DOTFILES_DIR:-"$(cd "$(dirname "$0")" || exit; pwd -P)"}"

_install() {
  _install_oh_my_zsh
  _install_oh_my_zsh_theme
  _install_homebrew
  _install_homebrew_packages
  _link_files
  _set_mac_defaults
}

_install_homebrew() {
  echo 'Installing Homebrew...'
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

_install_homebrew_packages() {
  echo 'Installing Homebrew packages...'
  brew update
  brew install ffmpeg gh htop node python tldr
  brew cask install docker imageoptim iterm2 rectangle visual-studio-code
}

_install_nvm() {
  echo "Installing nvm..."
  sh -c "$(curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh)"
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

_set_mac_defaults() {
  # Enable tap to click.
  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
  defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
  defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

  # Set dock options.
  defaults write com.apple.dock tilesize -int 32
  defaults write com.apple.dock show-process-indicators -bool true
  defaults write com.apple.dock autohide-delay -float 0
  defaults write com.apple.dock autohide-time-modifier -float 0
  killall Dock
}

case "$1" in
  install_homebrew) _install_homebrew;;
  install_homebrew_packages) _install_homebrew_packages;;
  install_oh_my_zsh) _install_oh_my_zsh;;
  install_oh_my_zsh_theme) _install_oh_my_zsh_theme;;
  link_files) _link_files;;
  set_mac_defaults) _set_mac_defaults;;
  *) _install;;
esac

echo 'Done.'
