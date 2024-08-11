#!/bin/bash

##### Variables

# Download location
core_dl_loc="/home/deck/dolphin/"
core_dl_file="dolphin_libretro.so"
info_dl_file="dolphin_libretro.info"
core_dl="${core_dl_loc}${core_dl_file}"
info_dl="${core_dl_loc}${info_dl_file}"

# Core Download Link:
core_host_loc="https://buildbot.libretro.com/nightly/linux/x86_64/latest/"
core_host_file="dolphin_libretro.so.zip"
core_host="${core_host_loc}${core_host_file}"

# Info Download Link:
info_host="https://raw.githubusercontent.com/AlgoClaw/DeckBash/main/dolphin_libretro.info"

# RetroArch Locations:
ra_steam_dir="/home/deck/.local/share/Steam/steamapps/common/RetroArch/"
ra_emudeck_dir="/home/deck/.var/app/org.libretro.RetroArch/config/retroarch/"

# RetroArch Core Locations:
ra_steam_dir_core="${ra_steam_dir}cores/"
ra_emudeck_dir_core="${ra_emudeck_dir}cores/"

# RetroArch Saves Locations:
ra_steam_dir_save="${ra_steam_dir}saves/"
ra_emudeck_dir_save="${ra_emudeck_dir}saves/"

##############
##############

# Download "dolphin_libretro.so" (if it does not exist):
if test -f "${core_dl}"; then
	true # exists
else
	# does not exist
	curl "${core_host}" --create-dirs -o "${core_dl_loc}${core_host_file}"
	unzip "${core_dl_loc}${core_host_file}" -d "${core_dl_loc}"
	rm -r "${core_dl_loc}${core_host_file}"
fi

# Copy "dolphin_libretro.so" to Steam's RA (if it does not exist):
if test -f "${ra_steam_dir_core}${core_dl_file}"; then
	true # exists
else
	# does not exist
	mkdir -p "${ra_steam_dir_core}"
	cp -R "${core_dl}" "${ra_steam_dir_core}${core_dl_file}"
fi

# Copy "dolphin_libretro.so" to EmuDeck's RA (if it does not exist):
if test -f "${ra_emudeck_dir_core}${core_dl_file}"; then
	true # exists
else
	# does not exist
	mkdir -p "${ra_emudeck_dir_core}"
	cp -R "${core_dl}" "${ra_emudeck_dir_core}${core_dl_file}"
fi

##############
##############

# Download "dolphin_libretro.info" (if it does not exist):
if test -f "${info_dl}"; then
	true # exists
else
	curl "${info_host}" --create-dirs -o "${info_dl}"
fi

# Copy "dolphin_libretro.info" file to Steam's RA (if it does not exist):
if test -f "${ra_steam_dir_core}${info_dl_file}"; then
	true # exists
else
	# does not exist
	mkdir -p "${ra_steam_dir_core}"
	cp -R "${info_dl}" "${ra_steam_dir_core}${info_dl_file}"
fi

# Copy "dolphin_libretro.info" file to EmuDeck's RA (if it does not exist):
if test -f "${ra_emudeck_dir_core}${info_dl_file}"; then
	true # exists
else
	# does not exist
	mkdir -p "${ra_emudeck_dir_core}"
	cp -R "${info_dl}" "${ra_emudeck_dir_core}${info_dl_file}"
fi

##############
##############

# Enable Boot Screen for Steam's RA
# might need to run Dolphin first
if test -f "${ra_steam_dir_save}User/Config/Dolphin.ini"; then
	sed -i '/SkipIPL /c\SkipIPL = False' "${ra_steam_dir_save}User/Config/Dolphin.ini"
fi

# Enable Boot Screen for EmuDeck's RA
# might need to run Dolphin first
if test -f "${ra_emudeck_dir_save}User/Config/Dolphin.ini"; then
	sed -i '/SkipIPL /c\SkipIPL = False' "${ra_steam_dir_save}User/Config/Dolphin.ini"
fi
