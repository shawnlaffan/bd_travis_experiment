#!/bin/bash
# install gdal

add-apt-repository -y ppa:ubuntugis/ubuntugis-unstable
apt-get update -qq
apt-get install libgdal1h libgdal-dev
#apt-get install -y python-gdal python3-gdal
