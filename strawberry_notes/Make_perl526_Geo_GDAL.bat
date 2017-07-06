rem Make Geo::GDAL Perl Binding
rem  steps courtesy Anderson Ku
rem Update base paths to match your system


:: Probably need the PDL version so we get the HDF and NetCDF etc libs.
set PERL_ROOT=C:\berrybrew\5.26.0_64_PDL
::set PERL_ROOT=C:\berrybrew\5.24.1_64_PDL

set GDAL_ROOT=C:\gdal_builds\gdal-2.2.0
set MSYS_ROOT=C:\msys64
set PATH=%PERL_ROOT%\c\bin;%PERL_ROOT%\perl\bin;%MSYS_ROOT%\usr\bin;%PATH%
::  5.26
set CPATH=%PERL_ROOT%\perl\lib\CORE;%PERL_ROOT%\c\include;%PERL_ROOT%\c\lib\gcc\x86_64-w64-mingw32\7.1.0\include;%PERL_ROOT%\c\lib\gcc\x86_64-w64-mingw32\7.1.0\include\c++;%PERL_ROOT%\c\lib\gcc\x86_64-w64-mingw32\7.1.0\include\ssp;%GDAL_ROOT%\port;%GDAL_ROOT%\gcore;%GDAL_ROOT%\ogr;%GDAL_ROOT%\alg;%GDAL_ROOT%\apps;


set MAKE=gmake

call %MAKE% clean

set PERL_GDAL_SOURCE_TREE=%GDAL_ROOT%
set PERL_GDAL_CONFIG=%GDAL_ROOT%/apps/gdal-config
set PERL_GDAL_NO_VERSION_CHECK=1
perl Makefile.PL --gdal-config=%GDAL_ROOT%/apps/gdal-config --no-version-check --gdal-source-tree=%GDAL_ROOT%

:: Edit make.bat to use gmake instead of dmake
:: Strawberry Perl 5.26 does not provide dmake, and 5.24 has both dmake and gmake
perl -p -i.bak -e "s/^dmake/gmake/" make.bat

call make
call make test
:: call make install
:: call prove
