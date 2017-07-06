export ST_PERL=/c/berrybrew/5.26.0_64_PDL
export GDAL_ROOT=/c/gdal_builds/gdal-2.1.2
export GDAL_ROOT=/c/gdal_builds/trunk/gdal
export GDAL_ROOT=/c/gdal_builds/gdal-2.2.0


export PATH=${ST_PERL}/c/bin:${ST_PERL}/perl/bin:${GDAL_ROOT}:${PATH}
export LIBRARY_PATH=${ST_PERL}/perl/lib/CORE:${ST_PERL}/c/lib:${GDAL_ROOT}
export CPATH=${ST_PERL}/c/include:${ST_PERL}/perl/lib/CORE:${GDAL_ROOT}/port:${GDAL_ROOT}/gcore:${GDAL_ROOT}/ogr:${GDAL_ROOT}/alg:${GDAL_ROOT}/apps
cd ${GDAL_ROOT}
#  curl causes issues in the Geo::GDAL build - prob just needs extra library paths to be added above
./configure --with-curl=no

#  Need to edit the makefile to change $(GDAL_ROOT) to be .
#  otherwise some lines are too long
perl -p -i.bak -e's/\$(GDAL_ROOT)/\./' GNUmakefile
make -j4
cd -
