#!/bin/sh

SRC_DIR="$(dirname "$(dirname "$(readlink -fm "$0")")")"
cd $SRC_DIR

# Get the user input:
read -p "Username: " ttiUsername
read -p "Gameserver (DEFAULT:  167.114.28.238): " TTI_GAMESERVER
TTI_GAMESERVER=${TTI_GAMESERVER:-"162.243.14.152"}

# Export the environment variables:
export ttiUsername=$ttiUsername
export ttiPassword="password"
export TTI_PLAYCOOKIE=$ttiUsername
export TTI_GAMESERVER=$TTI_GAMESERVER

echo "==============================="
echo "Starting Toontown Infinite..."
echo "Username: $ttiUsername"
echo "Gameserver: $TTI_GAMESERVER"
echo "==============================="

python -m toontown.toonbase.ClientStart
