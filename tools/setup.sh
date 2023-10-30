#!/usr/bin/env bash

function install_system_dependencies() {
  echo Expanding rootfs
  sudo raspi-config nonint do_expand_rootfs

  echo Installing Dependencies

  sudo apt update
  sudo apt upgrade -y

  sudo apt install python3 python3-pip git -y
}

function install_esphome() {
  # https://esphome.io/guides/installing_esphome.html
  pip3 install --upgrade wheel
  pip3 install --upgrade esphome
  export PATH=$PATH:$HOME/.local/bin
  esphome version
}

install_system_dependencies
install_esphome
