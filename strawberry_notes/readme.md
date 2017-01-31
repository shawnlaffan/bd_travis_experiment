= Building gdal and Geo::GDAL using Strawberry Perl =

These have been tested using Strawberry Perl 5.24.0 and the mingw64 shell (installed as part of msys2).

1.  Download and extract the source code for GDAL (or get it using svn).
1.  Download and extract the Geo::GDAL package from cpan.  Look for the download link at the left of https://metacpan.org/pod/Geo::GDAL
1.  Edit ```build_gdal.sh``` so the environment variables point to where you extracted gdal and to where you have Strawberry Perl.
1.  In the mingw64 shell, run build_gdal.sh
  1.  If you want to install gdal then run ```make install``` as well.
1.  In a windows command prompt, run ```Make_perl_Geo_GDAL.bat```
  1.  Currently t/utf8.t fails due to the unicode bug and windows file names.  It also uses the unix touch utility, so will fail under a vanilla window setup.
  1.  This appears to be more of a warning than an absolute error.  ```t/ogr.t ........ 1/? Warning 1: Value '12.2' of field unnamed.value parsed incompletely to integer 12.
ERROR 1: GeoJSON parsing error: unexpected character (at offset 0)```.  This looks to be due to this line: ```$l->InsertFeature([0,12.2,{wkt=>'POINT(1 1)'}]);```, and so is internal to gdal?
1.  If you want to install Geo::GDAL into your perl tree then run ```make install```
