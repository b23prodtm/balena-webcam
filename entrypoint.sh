#!/usr/bin/env bash
if [ -z "${SHM_SIZE}" ]; then
    echo "Calculating the SHM_SIZE value as 30% of Total Memory"
    SHM_SIZE=$(free -m | awk '/^Mem/ {printf "%.0fG",0.3*$2/1024}')
fi
# Kernel Parameters in docker-compose setting
sysctl fs.protected_regular=0
printf "Remounting shm with size %s ..." "${SHM_SIZE}"
mount -o remount,rw,exec,size="${SHM_SIZE}" /dev/shm
printf "Remounting shm with size %s ...DONE" "${SHM_SIZE}"
./mediamtx
