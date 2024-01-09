# Video-surveillance by Balena Hub [![CircleCI](https://dl.circleci.com/status-badge/img/gh/b23prodtm/asecuritywebcam/tree/main.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/b23prodtm/asecuritywebcam/tree/main)

If you're looking for a seamless, easy and innovative video surveillance system for your property, than this is the project you've been waiting for. We've created an app, that helps you deploying a video surveillance system on the hardware you prefer, with all the benefits you expect from a modern IoT system nowadays. The project is relying on the popular [Kerberos Agent](https://github.com/kerberos-io/agent), added with some additional [RTSP proxy](https://github.com/kerberos-io/camera-to-rtsp).

The idea of this project is to build and advance a video surveillance system with multiple Balena blocks and/or third-party containers, that make up the defacto video surveillance system anyone can use. The existing application is using following blocks:

- [Kerberos Agent](https://hub.balena.io/blocks/2064662/agent) is the foundation of the `video-surveillance` application.
- [Hostname](https://hub.balena.io/blocks/1918778/hostname-armv7hf) will allow the `video-surveillance` project to be reachable on your network by a DNS name.

## Getting Started

You can one-click-deploy this application using the button below:

[![deploy with balena](https://balena.io/deploy.svg)](https://dashboard.balena-cloud.com/deploy?repoUrl=https://github.com/b23prodtm/asecuritywebcam)

### Application Environment Variables

Application environment variables apply to all services within the application, and can be applied fleet-wide to apply to multiple devices.

| Name           | Description                                                                 |
| -------------- | --------------------------------------------------------------------------- |
| `SET_HOSTNAME` | Set a custom hostname on application start. Default is `videosurveillance`. |

### RSTP server
Currently only H264 RTSP streams are supported from mediamtx sidecar container

## Usage

## Node Package Manager

  This project depends on npmjs [balena-cloud-apps](https://www.npmjs.com/package/balena-cloud-apps). Please call
  `npm link balena-cloud-apps && npm update`
  whenever the system complains about `balena_deploy` not found.
After npm install succeeded, HuewizPi can be dbuilt and optionally deployed to the device

### Update BALENA_ARCH dependent files

When you make changes to `docker*.template` files and environment `*.env` files, you can apply changes that the CPU architecture depends on. To do so, run
deployment scripts `balena_deploy --nobuild` before to push packages:
``` Updates armhf files
./deploy.sh 1 --local [CTRL+C]
```
``` Updates aarch64 files
./deploy.sh 2 --local [CTRL+C]
```
```  Updates x86_64 files
./deploy.sh 3 --local [CTRL+C]
```

### Updating Docker service image (Dockerfile.template)

A new service image can be build
- Check values in `${BALENA_ARCH}.env`,
========================================================
| Node Machine   | `BALENA_MACHINE_NAME` | `BALENA_ARCH`
| ------------     ---------------------   -------------
| Raspberry Pi 3 | raspberrypi3           | armhf
| Raspberry Pi 4 | raspberrypi3-64       | aarch64
| Mini PC        | intel-nuc             | x86_64
========================================================
- Run `./deploy.sh [BALENA_ARCH] --nobuild`
  You can select 1:armhf, 2:aarch64 or 3:x86_64 as the target machine CPU
- You choose to build FROM a balenalib base image as set in Dockerfile.template, then type `0` or `CTRL-C` to exit the script
- All template data filters copy to Dockerfile.aarch64, Dockerfile.armhf and Dockerfile.x86_64

### Deploy to balena
Update balena apps after committing changes `git commit -a && git push`
  `. deploy.sh`

### Initial setup

Once your device joins the fleet you'll need to allow some time for it to download the application.

1. Connect to `http://YOUR-DEVICE-IP` or depending on the hostname `http://videosurveillance.local` in your browser
2. Sign-in with the default username `root`and password `root` or change using the environment variables.
3. Go to the configuration page and fill-in the RTSP url of your IPCamera.
4. Press save, and the Kerberos Agent will connect to your camera, and show a live view on the dashboard page.

Documentation for the Kerberos Agent and other services can be found at [`https://doc.kerberos.io/`](https://doc.kerberos.io/)
