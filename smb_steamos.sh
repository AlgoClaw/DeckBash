#!/bin/bash

sudo rm /home/deck/Scripts/smb_steamos_tmp.sh & wait

sudo curl https://raw.githubusercontent.com/AlgoClaw/DeckBash/main/smb_steamos_tmp.sh --create-dirs -o /home/deck/Scripts/smb_steamos_tmp.sh & wait

sudo bash /home/deck/Scripts/smb_steamos_tmp.sh
