#!/bin/bash

core_dir="/home/deck/.local/share/Steam/steamapps/common/RetroArch/cores/"

#### Make dolphin_libretro.info for solphin core in RA

tee -a "${core_dir}dolphin_libretro.info" > /dev/null <<EOT
# Software Information
display_name = "Nintendo - GameCube / Wii (Dolphin)"
authors = "Team Dolphin"
supported_extensions = "gcm|iso|wbfs|ciso|gcz|elf|dol|dff|tgc|wad|rvz|m3u|wia"
corename = "Dolphin"
categories = "Emulator"
license = "GPLv2+"
permissions = ""
display_version = "Git"

# Hardware Information
manufacturer = "Nintendo"
systemname = "GameCube/Wii"
systemid = "gamecube"

# Libretro Features
database = "Nintendo - GameCube|Nintendo - Wii|Nintendo - Wii (Digital)"
supports_no_game = "false"
libretro_saves = "true"
savestate = "true"
savestate_features = "deterministic"
cheats = "false"
input_descriptors = "true"
memory_descriptors = "false"
core_options = "true"
core_options_version = "1.0"
load_subsystem = "false"
hw_render = "true"
required_hw_api = "Vulkan >= 1.0 | Direct3D >= 10.0 | OpenGL Core >= 3.3 | OpenGL ES >= 3.0"
needs_fullpath = "true"
disk_control = "false"
is_experimental = "false"
EOT

#### get dolphin core
curl https://buildbot.libretro.com/nightly/linux/x86_64/latest/dolphin_libretro.so.zip --create-dirs -o "${core_dir}dolphin_libretro.so.zip"
unzip "${core_dir}dolphin_libretro.so.zip" -d "${core_dir}"
rm -r "${core_dir}dolphin_libretro.so.zip"
