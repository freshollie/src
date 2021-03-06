#!/bin/sh

ASTRON_DIR="$(dirname "$(dirname "$(readlink -fm "$0")")")"
cd $ASTRON_DIR/..

DISTRICT_NUM=${1:-$((-1))}

# Define some constants for our AI server:
MAX_CHANNELS=999999
STATESERVER=4002
ASTRON_IP="127.0.0.1:7100"
EVENTLOGGER_IP="127.0.0.1:7198"

# Get the user input if we were not set a channel
if [ "$DISTRICT_NUM" -eq "-1" ];
 then
    read -p "District name (DEFAULT: Nuttyboro): " DISTRICT_NAME
    DISTRICT_NAME=${DISTRICT_NAME:-Nuttyboro}
    read -p "Base channel (DEFAULT: 401000000): " BASE_CHANNEL
    BASE_CHANNEL=${BASE_CHANNEL:-401000000}
else
    DISTRICT_NAME="District $DISTRICT_NUM"
    BASE_CHANNEL=$((400000000 + 1000000 * $DISTRICT_NUM))
fi

echo "==============================="
echo "Starting Toontown Infinite AI server..."
echo "District name: $DISTRICT_NAME"
echo "Base channel: $BASE_CHANNEL"
echo "Max channels: $MAX_CHANNELS"
echo "State Server: $STATESERVER"
echo "Astron IP: $ASTRON_IP"
echo "Event Logger IP: $EVENTLOGGER_IP"
echo "==============================="

while [ true ]
do
    python2 -m toontown.ai.ServiceStart --base-channel $BASE_CHANNEL \
                     --max-channels $MAX_CHANNELS --stateserver $STATESERVER \
                     --astron-ip $ASTRON_IP --eventlogger-ip $EVENTLOGGER_IP \
                     --district-name "$DISTRICT_NAME"
done
