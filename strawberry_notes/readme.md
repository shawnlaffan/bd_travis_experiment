# Building gdal and Geo::GDAL using Strawberry Perl

There are two sets of instructions, one for Perl [version 5.24](#Using-Perl-version-524), and one for [version 5.26](#Using-Perl-version-526).  These are very similar, and should be combined at some point, as should the scripts.  

It appears that the PDL version of Strawberry perl is needed, as it provides HDF, NetCDF and other libraries that are not in the "vanilla" Strawberry releases.  


##  Using Perl version 5.24

These have been tested using Strawberry Perl 5.24.0 (with PDL), gdal 2.1.2 and Geo::GDAL 2.010301.
You will also need the mingw64 shell (installed as part of msys2).


  * Download and extract the source code for GDAL (or get it using svn).
  * Download and extract the Geo::GDAL package from cpan.  Look for the download link at the left of https://metacpan.org/pod/Geo::GDAL
  * Edit ```build_gdal.sh``` so the environment variables point to where you extracted gdal and to where you have Strawberry Perl.
  * In the mingw64 shell, run ```build_gdal.sh```
    * If you want to install gdal then run ```make install``` as well.
  * In a windows command prompt, run ```Make_perl_Geo_GDAL.bat```
    * Currently t/utf8.t fails due to the unicode bug and windows file names.  It also uses the unix touch utility, so will fail under a vanilla windows setup.
    * This appears to be an erroneous test.  ```t/ogr.t ........ 1/? Warning 1: Value '12.2' of field unnamed.value parsed incompletely to integer 12.
ERROR 1: GeoJSON parsing error: unexpected character (at offset 0)```.  This is triggered at this line: ```$l->InsertFeature([0,12.2,{wkt=>'POINT(1 1)'}]);```, but the field with 12.2 is declared as an Integer a few lines earlier.  
  * If you want to install Geo::GDAL into your perl tree then run ```make install```


## Using Perl version 5.26

These have been tested using Strawberry Perl 5.26.0 (with PDL), gdal 2.1.2 and Geo::GDAL 2.010301.
You will also need the mingw64 shell (installed as part of msys2).


  * If you are using Strawberry Perl 5.26.0.1 then:
    * Patch perl/lib/CORE/perl.h in 5.26.0 as per https://rt.cpan.org/Public/Bug/Display.html?id=121683
    * It seems to work, but there are no guarantees...
    * This has been patched in Strawberry Perl 5.26.0.2
  * Download and extract the source code for GDAL (or get it using svn).
  * Download and extract the Geo::GDAL package from cpan.  Look for the download link at the left of https://metacpan.org/pod/Geo::GDAL
  * Edit ```build_gdal_perl526.sh``` so the environment variables point to where you extracted gdal and to where you have Strawberry Perl.
  * In the mingw64 shell, run ```build_gdal_perl526.sh```
    * If you want to install gdal then run ```make install``` as well.
  * In a windows command prompt, run ```Make_perl526_Geo_GDAL.bat```
    * Currently t/utf8.t fails due to the unicode bug and windows file names.  It also uses the unix touch utility, so will fail under a vanilla windows setup.
    * This appears to be an erroneous test.  ```t/ogr.t ........ 1/? Warning 1: Value '12.2' of field unnamed.value parsed incompletely to integer 12.
  ERROR 1: GeoJSON parsing error: unexpected character (at offset 0)```.  This is triggered at this line: ```$l->InsertFeature([0,12.2,{wkt=>'POINT(1 1)'}]);```, but the field with 12.2 is declared as an Integer a few lines earlier.  
  * If you want to install Geo::GDAL into your perl tree then run ```make install```



