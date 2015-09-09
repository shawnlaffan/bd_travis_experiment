#!/bin/bash
# install gdal

#add-apt-repository -y ppa:ubuntugis/ubuntugis-unstable
#apt-get update -qq
#apt-get install libgdal1h libgdal-dev
#apt-get install -y python-gdal python3-gdal


wget http://download.osgeo.org/gdal/1.11.1/gdal-1.11.1.tar.gz
tar xvz gdal-1.11.1.tar.gz
ls
#cd gdal-1.11.1
mkdir ~/bin

gdal-1.11.1/configure --with-python --with-perl --prefix=~/bin
make
make install
