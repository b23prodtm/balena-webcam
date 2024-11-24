#!/usr/bin/env bash
if [ ! -n "$MEDIAMTX_FILE" ]; then
    printf "[WARN]: Please set a value for %s !\n" "MEDIAMTX_FILE"
else
    if [ ! -n "$MTX_PATH" ]; then
      export MTX_PATH=cam      
    fi
    if [ ! -n "$1" ]; then      
      printf "[$0]: Used %s as the default stream.\n" "$MTX_PATH"
    else
      export MTX_PATH="$1"
    fi
    cp -fv rtsp-simple-server-"$MTX_PATH".template "$MEDIAMTX_FILE"
fi
