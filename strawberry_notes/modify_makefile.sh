#!sh
#  need to perlify this
sed -i -e 's/RANLIB = rem/RANLIB = ranlib/' Makefile_*
sed -i -e 's/NOOP = rem/NOOP =/' Makefile_*
sed -i -e 's/DIRFILESEP = \\/DIRFILESEP = \//' Makefile_*
#  iostream issues - just comment it out
sed -i -e 's/^#include <iostream>/\/\/#include <iostream>/' *wrap.cpp
#  next line should not be needed
sed -i -e 's/\/mingw\/bin\/x86_64-w64-mingw32-g++/g++/' Makefile_*
# The paths were written in format: /c/strawberry\perl\bin\perl.exe etc, which turns into C:strawberryperlbinperl.exe.  The following should transform '\' into '/', excluding cases such as \" and \(end of line):
sed -i -e 's/\\\([^\"\\]\)/\/\1/g' Makefile_*
#  and change "C:/berrybrew
sed -i -e 's/C\:\/berrybrew/\/c\/berrybrew/g' Makefile_*

sed -i -e 's/CC \= gcc/CC \= g\+\+/' Makefile_*

sed -i -e 's/^OTHERLDFLAGS \=/OTHERLDFLAGS \= "\/c\/gdal_builds\/gdal-2.1.2\/libgdal-20.dll"/g' Makefile_*
