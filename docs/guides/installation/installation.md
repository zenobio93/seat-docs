![SeAT](https://i.imgur.com/aPPOxSK.png)

# Installation

A number of options are available to install SeAT. We highly recommend a Dockerized version as the installation and upgrade process is the fastest and most simple. Nonetheless, three methods exist to install SeAT:

- Via docker and a `docker-compose.yml` file.
- Via the installer scripts and the `seat` tool.
- Manually.

Each method has a detailed guide available that illustrates the steps either via screenshots or short videos.

!!! warning

    Make sure you review the [hardware](getting_started/#hardware-requirements) and [software](getting_started/#software-requirements) requirements sections before installing anything intended for production use!

## Docker (recommended)

WIP

## Installer (SeAT Tool)

A semi automated installation option for Debian 8 / 9, Ubuntu LTS versions and CentOS 7 is available. To get started with this method, a helper script should be downloaded and run.

!!! warning

    This installer assumes that *nothing else* is configured on the host operating system. If you have an existing database server or web server on the host this script is run on there is a high chance it will fail!

```bash
bash <(curl -fsSL https://git.io/seat-installer)
```

This will ask you to choose your operating system in order to prepare the `seat` tool for use.

Example usage:

```bash
$ bash <(curl -fsSL https://git.io/seat-installer)
 * SeAT Installer Operating System Selection
1) CentOS 6    3) Ubuntu 16x  5) Debian 9x
2) CentOS 7    4) Debian 8x   6) Quit
 * Please select the target operating system:
```

WIP
