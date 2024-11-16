#!/usr/bin/env bash
if [ ! -v MEDIAMTX_FILE ]; then
    printf "[WARN]: Please set a value for %s !\n" "MEDIAMTX_FILE"
else
    if [ "$1" = "rpicamera" ]; then
        cp -fv rtsp-simple-server-rpi.template "$MEDIAMTX_FILE"
    else    
        cp -fv rtsp-simple-server.template "$MEDIAMTX_FILE"
    fi
fi
if [ -z "${SHM_SIZE}" ]; then
    echo "Calculating the SHM_SIZE value as 30% of Total Memory"
    SHM_SIZE=$(free -m | awk '/^Mem/ {printf "%.0fG",0.3*$2/1024}')
fi
sysctl fs.protected_regular=0
printf "Remounting shm with size %s ..." "${SHM_SIZE}"
echo "Remounting shm with size ${SHMEM} ..."
umount -v /dev/shm
mount -v -t tmpfs -o rw,nosuid,nodev,exec,relatime,size="${SHM_SIZE}" tmpfs /dev/shm
printf "Remounting shm with size %s ...DONE" "${SHM_SIZE}"
