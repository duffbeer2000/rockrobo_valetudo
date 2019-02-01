FROM debian:latest

MAINTAINER Christian

ENV DEBIAN_FRONTEND noninteractive
ENV EMAIL=test@test.de

RUN apt-get update && apt-get install -y \
    apt-utils \
    bash \
    ccrypt \
    dos2unix \
    git \
    nano \
    net-tools \
    openssh-server \
    openssh-client \
    python3 \
    python3-pip \
    python3-venv \
    sed \
    tree \
    unzip \
    wget \
&& rm -rf /var/lib/apt/lists/*

## Switch shell to bash
SHELL ["/bin/bash", "-c"]

## Create a new directory for your work
RUN mkdir rockrobo
RUN cd rockrobo
#
## Clone the dustcloud repository (until imagebuilder > 0.1 is available)
#RUN git clone https://github.com/dgiese/dustcloud.git
#
## Create a directory for dummycloud
#RUN mkdir dummycloud
#RUN pushd dummycloud
#
## Download dummycloud from https://github.com/dgiese/dustcloud/releases
#RUN wget https://github.com/dgiese/dustcloud/releases
#RUN unzip -a 'dummycloud*.zip'
#RUN popd

#### Create a valetudo directory
###RUN mkdir valetudo
###RUN pushd valetudo
###
#### Download the latest valetudo binary from https://github.com/Hypfer/Valetudo/releases
###RUN wget https://github ...
###RUN mkdir deployment
###RUN pushd deployment
###RUN wget https://github.com/Hypfer/Valetudo/raw/master/deployment/valetudo.conf
###RUN popd
###RUN popd
###
#### Create rrlogd-patcher directory
###RUN mkdir rrlogd-patcher
###RUN pushd rrlogd-patcher
###
#### Download the latest patcher.py
###RUN wget https://raw.githubusercontent.com/JohnRev/rrlogd-patcher/master/patcher.py
###RUN popd
###
#### Create firmware directory
###RUN mkdir firmware
###RUN pushd firmware
###
#### Download the latest firmware (e.g. v001792)
###RUN wget https://dustcloud.seemoo.de/public/temp/v11_001792.pkg
###
#### Download sound package
###RUN wget https://github.com/dgiese/dustcloud/raw/master/devices/xiaomi.vacuum/original-soundpackages/encrypted/english.pkg
###RUN popd
###
#### If you followed the above commands, yourrockrobo directory structure should now look like this:
###RUN tree -L 2 rockrobo/
###
#### To create the firmware image you should run the following commands:
###RUN mkdir image
###RUN cd image     
####RUN sudo ../dustcloud/devices/xiaomi.vacuum/firmwarebuilder/imagebuilder.sh \
####     --firmware=../firmware/v11_001792.pkg \
####     --soundfile=../firmware/english.pkg \
####     --public-key=$HOME/.ssh/id_ed25519.pub \
####     --dummycloud-path=../dummycloud \
####     --valetudo-path=../valetudo \
####     --disable-firmware-updates \
####     --ntpserver=fritz.box \
####     --rrlogd-patcher=../rrlogd-patcher/patcher.py \
####     --replace-adbd
###
###
###
###
###
###
###RUN ssh-keygen -t ed25519 -C $EMAIL
#RUN tail -f /dev/null
