![SeAT](https://i.imgur.com/aPPOxSK.png)

# Getting Started

Before you rush ahead and install SeAT, it would be a good idea to review what you need first. Once you have done this, head over to the [quick install](quick_install/) guide to start the actual installation.

## Software Requirements

SeAT is a self hosted web application. This means that you will need your own server (and optional domain) to host SeAT. SeAT has a number of software requirements to function. Those are:

- [PHP7.1](http://php.net/). At least version 7.1.
- A database server which can be either [MariaDB](https://mariadb.org/) (_recommended_) or [MySQL](https://www.mysql.com/). This is by far the most important component as it stores everything.
- A caching service provided by [Redis](https://redis.io/). A lot of data is cached within SeAT in order to speed things up!
- A service supervisor such as [Supervisor](http://supervisord.org/)

!!! note

    Guidance on how to install everything will be provided later in this document. For now this serves simply as an informational component.

### Software Versions

Software version requirements are based on a *minimum* requirement (Dockerized installation methods take care of these for you!). The requirements are:

- For Linux, almost any distribution that can run PHP and a Web server should be fine. For Windows, you need Docker with Linux containers
- PHP Version 7.1
- Supervisor Version 3
- MariaDB 10.2.7 or greater (or MySQL Version 5.7 or greater)
- Any Web server such as Apache or Nginx

## Hardware Requirements

As far as hardware goes, there isn't really a hard and fast rule on what is needed. The more resources you make available, the faster API updates will occur. However, there are some minimum *recommended* specifications.

- Memory            : 1GB of RAM. Less can work, it will just be _really_  slow.
- Hard Drive Space  : 10GB (used mostly by the database and the EVE API caching)
- Operating System  : Any linux distribution will work with SeAT (depending on how you choose to install). For Windows, the only option available is [Docker for Windows](https://docs.docker.com/docker-for-windows/) with Linux containers

!!! warning

    If you intend to process a large amount of data, plan your storage accordingly. The SeAT database can grow incredibly quickly depending on the amount of tokens you process.
