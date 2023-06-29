# Video-surveillance by Balena Hub

If you're looking for a seamless, easy and innovative video surveillance system for your property, than this is the project you've been waiting for. We've create an app [`video-surveillance` on Balena Hub](https://hub.balena.io/apps/2064752/video-surveillance), that helps you deploying a video surveillance system on the hardware you prefer, with all the benefits you expect from a modern IoT system nowadays. The project is relying on the popular [Kerberos Agent](https://github.com/kerberos-io/agent).

The idea of this project is to build and advance a video surveillance system with multiple Balena blocks and/or third-party containers, that make up the defacto video surveillance system anyone can use. The existing [`video-surveillance`](https://hub.balena.io/apps/2064752/video-surveillance) application is using following blocks:

- [Kerberos Agent](https://hub.balena.io/blocks/2064662/agent) is the foundation of the `video-surveillance` application.
- [Hostname](https://hub.balena.io/blocks/1918778/hostname-armv7hf) will allow the `video-surveillance` project to be reachable on your network by a DNS name.

## Getting Started

You can one-click-deploy this application using the button below:

[![deploy with balena](https://balena.io/deploy.svg)](https://dashboard.balena-cloud.com/deploy?repoUrl=https://github.com/kerberos-io/balena-agent)

### Application Environment Variables

Application environment variables apply to all services within the application, and can be applied fleet-wide to apply to multiple devices.

| Name           | Description                                                                 |
| -------------- | --------------------------------------------------------------------------- |
| `SET_HOSTNAME` | Set a custom hostname on application start. Default is `videosurveillance`. |

## Usage

### Initial setup

Once your device joins the fleet you'll need to allow some time for it to download the application.

1. Connect to `http://YOUR-DEVICE-IP` or depending on the hostname `http://videosurveillance.local` in your browser
2. Sign-in with the default username `root`and password `root` or [change using the environment variables](https://github.com/kerberos-io/agent/tree/master#configure-with-environment-variables).
3. Go to the configuration page and fill-in the RTSP url of your IPCamera.
4. Press save, and the Kerberos Agent will connect to your camera, and show a live view on the dashboard page.

Documentation for the Kerberos Agent and other services can be found at [`https://doc.kerberos.io/`](https://doc.kerberos.io/)
