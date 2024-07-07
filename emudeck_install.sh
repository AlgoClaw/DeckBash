#!/bin/bash

FILE="/home/deck/Scripts/emudeck_install_tmp.sh"

sudo rm -f "${FILE}"

sudo curl https://raw.githubusercontent.com/dragoonDorise/EmuDeck/main/install.sh --create-dirs -o "${FILE}"

sudo bash "${FILE}"
