rem Make Geo::GDAL Perl Binding
rem  steps courtesy Anderson Ku
rem Update base paths to match your system

set PERL_ROOT=C:\berrybrew\5.24.0_64_PDL
set GDAL_ROOT=C:\gdal_builds\gdal-2.1.2
set MSYS_ROOT=C:\msys64
set PATH=%PERL_ROOT%\c\bin;%PERL_ROOT%\perl\bin;%MSYS_ROOT%\usr\bin;%PATH%
set CPATH=%PERL_ROOT%\c\include;%PERL_ROOT%\perl\lib\CORE;%GDAL_ROOT%\port;%GDAL_ROOT%\gcore;%GDAL_ROOT%\ogr;%GDAL_ROOT%\alg;%GDAL_ROOT%\apps;%PERL_ROOT%\c\x86_64-w64-mingw32\include\c++;

call make clean
perl Makefile.PL MAKE=gmake --gdal-config=%GDAL_ROOT%/apps/gdal-config --no-version-check --gdal-source-tree=%GDAL_ROOT%

:: Redundant now we add include\c++ to CPATH
:: SWL: should perlify these
:: sed -i -e 's^|^^#include ^<iostream^>^|^/^/#include ^<iostream^>^|' *wrap.cpp
:: sed -i -e 's^|^^void VSIStdoutUnsetRedirection()^|#undef fwrite\nvoid VSIStdoutUnsetRedirection()^|' *wrap.cpp

:: Redundant when using gmake
::  definitely need to perlify these, as the third one does not run under windows:
:: sed -i -e 's/RANLIB = rem/RANLIB = ranlib/' Makefile_*
:: sed -i -e 's/NOOP = rem/NOOP =/' Makefile_*
:: sed -i -e 's|DIRFILESEP = \\|DIRFILESEP = /|' Makefile_*

rem YOU NEED TO EDIT make.bat to use gmake instead of dmake
call make
call make test
:: call make install
:: call prove
