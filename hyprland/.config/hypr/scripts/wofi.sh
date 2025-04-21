#!/usr/bin/env bash

CONFIG="$HOME/.config/hypr/wofi/config/config"
STYLE="$HOME/.config/hypr/wofi/src/mocha/style.css"

if ! pgrep -x wofi >/dev/null; then
    wofi --conf "${CONFIG}" --style "${STYLE}" --allow-images
else
    pkill wofi
fi
