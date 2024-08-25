#!/usr/bin/env bash
if [ -n "$MEDIAMTX_FILE" ]; then
    printf "[WARN]: Please set a value for %s !\n" "MEDIAMTX_FILE";
else
    if [ "$1" = "rpicamera" ]; then
        cp -fv rtsp-simple-server-rpi.template "$MEDIAMTX_FILE"
    else    
        cp -fv rtsp-simple-server.template "$MEDIAMTX_FILE"
    fi