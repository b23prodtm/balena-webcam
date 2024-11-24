#!/usr/bin/env bash
if [ ! -v MEDIAMTX_FILE ]; then
    printf "[WARN]: Please set a value for %s !\n" "MEDIAMTX_FILE"
else
    if [ ! -v "$1" ]; then      
      printf "[$0]: Used %s as the default stream.\n" "$MTX_PATH"
    fi
    if [ ! -v "$MTX_PATH" ]; then
      export MTX_PATH=webcam
    fi
    cp -fv rtsp-simple-server-"$MTX_PATH".template "$MEDIAMTX_FILE"
fi
