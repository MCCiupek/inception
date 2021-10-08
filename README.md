# inception
This project aims to broaden your knowledge of system administration by using Docker. You will virtualize several Docker images, creating them in your new personal virtual machine.

## Objectives
* System administration

## Skills
* Rigor
* Network & system administration

##
<p align="center">
  <img src="https://user-images.githubusercontent.com/51337012/136004771-f155cfa6-385e-4d5c-8c1c-a7fdd08df060.png" />
 </p>

## Docker
**Docker** is a software that can package your application, its dependencies, system tools, system libraries and settings in a single comprehensive **virtual container**. This combined package, which contains everything that’s needed to run your application, is called a **Docker container image**. This image is a **standalone, executable software package** which runs reliably on any server — Linux, Windows, macOS, public cloud or private cloud. Also, these images can be used to run the application as an isolated process in user space.

## Docker Workflow

The application or the project code is written in a **Docker file**. This file contains the application requirements and dependencies. This file produces a **Docker image** that is used later on to execute the code in the file.

An **image** contains the code, environment variables, config files, run time and libraries needed to run the application. The images are then uploaded to the Docker Hub, which is a GIT repository consisting of Docker images. From these repositories, you can fetch and upload your own Docker images.

As all these **containers** may be isolated from each other, **Docker networking** is the set of rules by which they interact with each other.

## Docker Network

### Main drivers

* Bridge: private default network. Works with IP addressing. ``docker network inspect bridge`` will return the JSON object that will describe the bridge network.
* Host: used for standalone containers. This networking mode is useful when a container handles a large number of ports. Moreover, the host driver allows you to run several web containers on the same single host.
* None: In this type of network, the containers have no access to external networks and are not attached to other containers or networks. None is used when you wish to disable the networking stack on a particular container.
* Overlay
* Macvlan
* Network plug-ins

### Usefull commands

Command | Code | Usage
--- | --- | ---
List Docker networks | ``docker network ls`` | list all the Docker networks on the host
Creating a Docker network | ``docker network create –-driver <drivername> <name>`` | create a network before launching a container, *drivername* is the name given to the network driver and *name* is the name of the network.
List network commands | ``docker network help`` | listing the available network commands
Removing a network | ``docker network rm <network>`` | remove the network *network*
Connecting to a Docker network | ``docker container run -it –net=<network> nginx`` | When you create a Docker network, by default it is connected to the bridge network. Use this command to connect to another network when you run the container
Obtaining container ports | ``docker port <container_name/id>`` | get the container’s port

## Overview of the Installation Process

<p align="center">
  <img src="https://user-images.githubusercontent.com/51337012/136026821-68bcafc0-a3d5-469d-a46f-fb4fe37b9eff.png" />
 </p>

## Sources

* [Introduction to Docker Networking: Networking Basics, Workflow, Networking Commands](https://medium.com/@upGrad/introduction-to-docker-networking-workflow-networking-basics-networking-commands-5a62e745afad)
* [WordPress Deployment with NGINX, PHP-FPM and MariaDB using Docker Compose](https://medium.com/swlh/wordpress-deployment-with-nginx-php-fpm-and-mariadb-using-docker-compose-55f59e5c1a)
* [How to Build Docker Images with Dockerfile](https://linuxize.com/post/how-to-build-docker-images-with-dockerfile/)

## 
Grade: /100
