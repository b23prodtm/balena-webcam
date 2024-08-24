#!/usr/bin/env bash
if [ "$1" = "rpicamera" ]; then
    cp -fv rtsp-simple-server-rpi.yml mediamtx.yml
else
    cp -fv rtsp-simple-server.yml mediamtx.yml
fi