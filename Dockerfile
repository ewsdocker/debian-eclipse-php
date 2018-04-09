# =========================================================================
# =========================================================================
#
#	Dockerfile
#	  Dockerfile for eclipse-php-oxygen-2 + php-5.6
#		in a Debian 9.4 (Stretch) docker container.
#
# =========================================================================
#
# @author Jay Wheeler.
# @version 1.0.0
# @copyright © 2018. EarthWalk Software.
# @license Licensed under the Academic Free License version 3.0
# @package ewsdocker/debian-eclipse-php
# @subpackage Dockerfile
#
# =========================================================================
#
#	Copyright © 2018. EarthWalk Software
#	Licensed under the Academic Free License, version 3.0.
#
#	Refer to the file named License.txt provided with the source,
#	or from
#
#		http://opensource.org/licenses/academic.php
#
# =========================================================================
# =========================================================================
FROM earthwalksoftware/debian-base-gui:latest

MAINTAINER Jay Wheeler <EarthWalkSoftware@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

# =========================================================================
#
#     The following must be modified before running a build,
#         as there is no way to specify them in the build 
#         command.
#
# 	  Eclipse repository address
#
# =========================================================================
#ENV ECLIPSE_HOST=http://pkgnginx 
ENV ECLIPSE_HOST=http://mirror.csclub.uwaterloo.ca/eclipse/technology/epp/downloads/release/oxygen/2

ENV ECLIPSE_PKG=eclipse-php-oxygen-2-linux-gtk-x86_64.tar.gz 
ENV ECLIPSE_DIR=eclipse 
ENV ECLIPSE_URL=${ECLIPSE_HOST}/${ECLIPSE_PKG}

# =========================================================================

COPY scripts/. / 

# =========================================================================

RUN mkdir -p /etc/BUILDS/ \
 && printf "${LMSBUILD_DOCKER} (${LMSBUILD_PACKAGE}), %s @ %s\n" `date '+%Y-%m-%d'` `date '+%H:%M:%S'` > /etc/BUILDS/CONTAINER.txt \
 && echo "deb https://packages.sury.org/php/ stretch main" >> /etc/apt/sources.list \
 && wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg \
 && apt-get -y update \
 && apt-get -y upgrade \
 && apt-get -y install \
               java-common \
               libgtk2.0-bin \
               libgtk-3-0 \
               libgtk-3-bin \
               libgtk-3-common \ 
               libgtk2.0-0 \
               libgtk2.0-common \
               openjdk-8-jre \
               openjdk-8-jre-headless \
               php5.6 \
               php5.6-apcu \ 
               php5.6-cgi \
               php5.6-cli \ 
               php5.6-curl \
               php5.6-fpm \
               php5.6-gd \ 
               php5.6-intl \ 
               php5.6-json \ 
               php5.6-mbstring \
               php5.6-mcrypt \ 
               php5.6-mysqlnd \
               php5.6-phar \ 
               php5.6-xml \
 && apt-get clean all \
 && mkdir composer \ 
 && cd composer \
 && curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer \
 && cd /usr/local/share \
 && wget -q ${ECLIPSE_URL} \
 && tar -xvf ${ECLIPSE_PKG} \
 && ln -s /usr/local/share/${ECLIPSE_DIR}/eclipse /usr/local/bin/eclipse 

# =========================================================================

VOLUME /library
VOLUME /source
VOLUME /userbin

VOLUME /workspace
WORKDIR /workspace

# =========================================================================

ENTRYPOINT ["/my_init", "--quiet"]
CMD ["/usr/local/bin/eclipse"]
