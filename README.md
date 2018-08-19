## ewsdocker/debian-eclipse-php:9.5.2  

**Eclipse IDE for Php Development Tools (PDT) with Php 5.6 in a Debian 9.5 Docker image.**  

Now with support branches for **Eclipse IDE Photon** and **Eclipse IDE Oxygen** versions.
____  

**Pre-built Docker images are available from [ewsdocker/debian-eclipse-php](https://hub.docker.com/r/ewsdocker/debian-eclipse-php).**  

____  

**NOTE**  
**ewsdocker/debian-eclipse-php** is designed to be used on a Linux system configured to support **Docker user namespaces** .  Refer to [ewsdocker Containers and Docker User Namespaces](https://github.com/ewsdocker/ewsdocker.github.io/wiki/UserNS-Overview) for an overview and information on running **ewsdocker/debian-eclipse-php** on a system not configured for **Docker user namespaces**.
____  

**Visit the [ewsdocker/debian-eclipse-php Wiki](https://github.com/ewsdocker/debian-eclipse-php/wiki/QuickStart) for complete documentation of this docker image.**  
____  

**About the size of the image**  

The main design specifications of the **ewsdocker** desktop application images are:  

  + Provide the same desktop experience as the user would have on a full application installation on a host desktop (including desktop menu interface, audio, video, multimedia, ...);  
  + Install the latest release directly from the software vendor's repository, or a certified mirror, reducing dependencies on host operating system implementations of the application;  
  + Leverage **Docker** container capabilities to 

   - provide isolation of the **Docker** container applications from the **Docker** host;  
   - provide persistence of application settings between **docker run** commands, and between future releases, allowing fast container deletion and re-creation; and  
   - quickly perform container replications, container updates, and recovery from software malfunction/corruption.

Most of the **ewsdocker** desktop application images are based on the latest **Debian** docker image, since fewer problems have been encountered when implementing the desktop applications on that platform.  
  
Obviously, these **Docker** images tend to be rather large compared to most **Docker** images. It may take a bit longer to download, but the convenience of having the application in a **docker image** is worth the small, (usually) one time investment in download time.

____  

**Installing ewsdocker/debian-eclipse-php**  

The following scripts will download the selected **ewsdocker/debian-eclipse-php** image, create a container, setup and populate the directory structures, create the run-time scripts, and install the application's desktop file(s).  

The _default_ values will install all directories and contents in the **docker host** user's home directory (refer to [Mapping docker host resources to the docker container](https://github.com/ewsdocker/debian-eclipse-php/wiki/QuickStart#mapping)),  

**ewsdocker/debian-eclipse-php:9.5.2-photon**  
  
    docker run --rm \
               -v ${HOME}/bin:/userbin \
               -v ${HOME}/.local:/usrlocal \
               -e LMS_BASE="${HOME}/.local" \
               -v ${HOME}/.config/docker:/conf \
               -v ${HOME}/.config/docker/debian-eclipse-php-9.5.2-photon:/root \
               --name=debian-eclipse-php-9.5.2-photon \
           ewsdocker/debian-eclipse-php:9.5.2-photon lms-setup  

____  
  
**ewsdocker/debian-eclipse-php:9.5.2-oxygen**  
  
    docker run --rm \
               -v ${HOME}/bin:/userbin \
               -v ${HOME}/.local:/usrlocal \
               -e LMS_BASE="${HOME}/.local" \
               -v ${HOME}/.config/docker:/conf \
               -v ${HOME}/.config/docker/debian-eclipse-php-9.5.2-oxygen:/root \
               --name=debian-eclipse-php-9.5.2-oxygen \
           ewsdocker/debian-eclipse-php:9.5.2-oxygen lms-setup  

____  

**ewsdocker/debian-eclipse-php:1.1.10**  
  
    docker run --rm \
               -v ${HOME}/bin:/userbin \
               -v ${HOME}/.local:/usrlocal \
               -e LMS_BASE="${HOME}/.local" \
               -v ${HOME}/.config/docker:/conf \
               -v ${HOME}/.config/docker/debian-eclipse-php-1.1.10:/root \
               --name=debian-eclipse-php-1.1.10 \
           ewsdocker/debian-eclipse-php:1.1.10 lms-setup  

____  

Refer to [Mapping docker host resources to the docker container](https://github.com/ewsdocker/debian-eclipse-php/wiki/QuickStart#mapping) for a discussion of **lms-setup** and what it does.  

____  

**Running the installed scripts**

After running the above command script, and using the settings indicated, the docker host directories, mapped as shown in the above tables, will be configured as follows:

+ the executable scripts have been copied to **~/bin**;  
+ the application desktop file(s) have been copied to **~/.local/share/applications**, and are availablie in any _task bar_ menu;  
+ the associated **debian-eclipse-php-"version"-"branch"** executable script (shown below) will be found in **~/.local/bin**, and _should_ be customized with proper local volume names.  

____  

**Executable scripts**  

**ewsdocker/debian-eclipse-php:9.5.2-photon**
  
    docker run -e DISPLAY=unix${DISPLAY} \
               -v /tmp/.X11-unix:/tmp/.X11-unix \
               -v ${HOME}/.Xauthority:${HOME}/.Xauthority \
               -v /etc/localtime:/etc/localtime:ro \
               -v ${HOME}/source:/source \
               -v ${HOME}/workspace:/workspace \
               -v ${HOME}/git/ewsdocker:/project \
               -v ${HOME}/.config/docker/debian-eclipse-php-9.5.2-photon:/root \
               --name=debian-eclipse-php-9.5.2-photon \
          ewsdocker/debian-eclipse-php:9.5.2-photon  

**ewsdocker/debian-eclipse-php:9.5.2-oxygen**
  
    docker run -e DISPLAY=unix${DISPLAY} \
               -v /tmp/.X11-unix:/tmp/.X11-unix \
               -v ${HOME}/.Xauthority:${HOME}/.Xauthority \
               -v /etc/localtime:/etc/localtime:ro \
               -v ${HOME}/source:/source \
               -v ${HOME}/workspace:/workspace \
               -v ${HOME}/git/ewsdocker:/project \
               -v ${HOME}/.config/docker/debian-eclipse-php-9.5.2-oxygen:/root \
               --name=debian-eclipse-php-9.5.2-oxygen \
           ewsdocker/debian-eclipse-php:9.5.2-oxygen  

**ewsdocker/debian-eclipse-php:1.1.10**
  
    docker run -e DISPLAY=unix${DISPLAY} \
               -v /tmp/.X11-unix:/tmp/.X11-unix \
               -v ${HOME}/.Xauthority:${HOME}/.Xauthority \
               -v /etc/localtime:/etc/localtime:ro \
               -v ${HOME}/source:/source \
               -v ${HOME}/workspace:/workspace \
               -v ${HOME}/git/ewsdocker:/project \
               -v ${HOME}/.config/docker/debian-eclipse-php-1.1.10:/root \
               --name=debian-eclipse-php-1.1.10 \
           ewsdocker/debian-eclipse-php:1.1.10  
____  
Refer to [Mapping docker host resources to the docker container](https://github.com/ewsdocker/debian-eclipse-php/wiki/QuickStart#mapping) for a discussion of customizing the executable scripts..  

____  

**Regarding edge-photon and edge-oxygen**  

For the very brave, if an _edge_ tag is available, these instructions will download, rename and install the _edge_ version.  Good luck.  

____  

**ewsdocker/debian-eclipse-php:edge-photon**  

**edge-photon** is the development tag for the **9.5.3** release tag.

    docker pull ewsdocker/debian-eclipse-php:edge-photon
    docker tag ewsdocker/debian-eclipse-php:edge-photon ewsdocker/debian-eclipse-php:9.5.3-photon
    docker run --rm \
               -v ${HOME}/bin:/userbin \
               -v ${HOME}/.local:/usrlocal \
               -e LMS_BASE="${HOME}/.local" \
               -v ${HOME}/.config/docker:/conf \
               -v ${HOME}/.config/docker/debian-eclipse-php-9.5.3-photon:/root \
               --name=debian-eclipse-php-9.5.3-photon \
           ewsdocker/debian-eclipse-php:9.5.3-photon lms-setup  

optional step:

    docker rmi ewsdocker/debian-eclipse-php:edge-photon  

To create and run the container, run **Eclipse PDT 9.5.3-photon** from the _Programming_ category of any desktop menu, or from the command-line, the following should work:

    ~/.local/bin/debian-eclipse-php:9.5.3-photon  

____  

**ewsdocker/debian-eclipse-php:edge-oxygen**  

**edge-oxygen** is the development tag for the **9.5.3** release tag.

    docker pull ewsdocker/debian-eclipse-php:edge-oxygen
    docker tag ewsdocker/debian-eclipse-php:edge-oxygen ewsdocker/debian-eclipse-php:9.5.3-oxygen
    docker run --rm \
               -v ${HOME}/bin:/userbin \
               -v ${HOME}/.local:/usrlocal \
               -e LMS_BASE="${HOME}/.local" \
               -v ${HOME}/.config/docker:/conf \
               -v ${HOME}/.config/docker/debian-eclipse-php-9.5.3-oxygen:/root \
               --name=debian-eclipse-php-9.5.3-oxygen \
           ewsdocker/debian-eclipse-php:9.5.3-oxygen lms-setup  

optional step:

    docker rmi ewsdocker/debian-eclipse-php:edge-oxygen  

To create and run the container, run **Eclipse PDT 9.5.3-oxygen** from the _Programming_ category of any desktop menu, or from the command-line, the following should work:

    ~/.local/bin/debian-eclipse-php:9.5.3-oxygen  

____  

**Persistence**  
In order to persist the Eclipse application state, a location on the docker _host_ must be provided to store the necessary information.  This can be accomplished with the following volume option in the run command:

    -v ${HOME}/.config/docker/debian-eclipse-php-"version"-"branch":/root  

Since the information is stored in the docker _container_ **/root** directory, this statement maps the user's **~/.config/docker/debian-eclipse-php-"version"-"branch"** docker _host_ directory to the **/root** directory in the docker _container_.  
____  
**Timestamps**  
It is important to keep the time and date on docker _host_ files that have been created and/or modified by the docker _containter_ synchronized with the docker _host_'s settings. This can be accomplished as follows:

    -v /etc/localtime:/etc/localtime:ro  

____  
**About the X11 Server / GUI Stack**  
The **ewsdocker/debian-eclipse-php** image is built on the [ewsdocker/debian-openjre](https://github.com/ewsdocker/debian-openjre/wiki) docker image, which is built on the [ewsdocker/debian-base-gui](https://github.com/ewsdocker/debian-base-gui/wiki) docker image. These two docker images provide the **X11-Server** stack and several **GUI** system elements.  The **X11-Server** stack is configured in the _docker run_ command as follows:

    docker run -e DISPLAY=unix${DISPLAY} \
               -v /tmp/.X11-unix:/tmp/.X11-unix \
               -v ${HOME}/.Xauthority:${HOME}/.Xauthority \

Since these options are _the same for all gui containers_, they should probably be the first options in the docker run command.  

____  

**Copyright © 2018. EarthWalk Software.**  
**Licensed under the GNU General Public License, GPL-3.0-or-later.**  

This file is part of **ewsdocker/debian-eclipse-php**.  

**ewsdocker/debian-eclipse-php** is free software: you can redistribute 
it and/or modify it under the terms of the GNU General Public License 
as published by the Free Software Foundation, either version 3 of the 
License, or (at your option) any later version.  

**ewsdocker/debian-eclipse-php** is distributed in the hope that it will 
be useful, but WITHOUT ANY WARRANTY; without even the implied warranty 
of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.  

You should have received a copy of the GNU General Public License
along with **ewsdocker/debian-eclipse-php**.  If not, see 
<http://www.gnu.org/licenses/>.  

