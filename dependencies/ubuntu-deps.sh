#!/bin/bash

#Install all required ubuntu dependences for cuda and opencv setup
apt-get update && \
apt-get install -y --fix-missing --no-install-recommends \
apt-utils \
build-essential \
cmake \
curl \
binutils \
gdb \
git \
freeglut3 \
freeglut3-dev \
libxi-dev \
libxmu-dev \
gfortran \
pkg-config \
libboost-python-dev \
libboost-thread-dev \
pbzip2 \
rsync \
software-properties-common \
libboost-all-dev \
libopenblas-dev \
libtbb2 \
libtbb-dev \
libjpeg-dev \
libpng-dev \
libtiff-dev \
libgraphicsmagick1-dev \
libswresample-dev \
libavformat-dev \
libhdf5-dev \
libpq-dev \
libgraphicsmagick1-dev \
libavcodec-dev \
libgtk2.0-dev \
libgtk-3-dev \
libv4l-dev \
libxvidcore-dev \
libx264-dev \
libatlas-base-dev \
liblapack-dev \
liblapacke-dev \
libswscale-dev \
libcanberra-gtk-module \
libboost-dev \
libboost-all-dev \
libeigen3-dev \
xorg \
libx11-dev \
libxcb-xinerama0-dev \
libxcb.*-dev \
libgl1-mesa-glx \
libgl1-mesa-dri \
libgl1-mesa-dev \
libglu1-mesa-dev \
mesa-common-dev \
libqt5x11extras5-dev \
libqt5svg5-dev \
libqt5multimedia5-plugins \
libqt5multimedia5 \
libqt5webkit5-dev \
wget \
vim \
qtbase5-dev \
qtchooser \
qt5-qmake \
qttools5-dev \
qttools5-dev-tools \
python3 \
python3-pip \
python3-numpy \
qtbase5-dev-tools \
unzip \
zip \
&& \
apt-get clean && \
rm -rf /var/lib/apt/lists/*  && \
apt-get clean && \
rm -rf /tmp/* /var/tmp/*