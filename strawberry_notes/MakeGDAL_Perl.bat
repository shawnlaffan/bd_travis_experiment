#  steps courtesy Anderson Ku
rem Make Geo::GDAL Perl Binding
set PERL_ROOT=D:\sperl
set GDAL_ROOT=D:\gdal
set MSYS_ROOT=D:\msys64
set PATH=%PERL_ROOT%\c\bin;%PERL_ROOT%\perl\bin;%MSYS_ROOT%\usr\bin;%PATH%
set CPATH=%PERL_ROOT%\c\include;%PERL_ROOT%\perl\lib\CORE;%GDAL_ROOT%\port;%GDAL_ROOT%\gcore;%GDAL_ROOT%\ogr;%GDAL_ROOT%\alg;%GDAL_ROOT%\apps;

call make clean
perl Makefile.PL --gdal-config=%GDAL_ROOT%/apps/gdal-config --no-version-check --gdal-source-tree=%GDAL_ROOT%

#SWL: should perlify these
sed -i -e 's^|^^#include ^<iostream^>^|^/^/#include ^<iostream^>^|' *wrap.cpp
sed -i -e 's^|^^void VSIStdoutUnsetRedirection()^|#undef fwrite\nvoid VSIStdoutUnsetRedirection()^|' *wrap.cpp

call make
call make install
call prove
