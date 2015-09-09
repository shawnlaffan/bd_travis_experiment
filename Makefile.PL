use 5.006;
use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME             => 'Blort',
    AUTHOR           => q{Shawn Laffan <shawnlaffan@gmail.com>},
    VERSION_FROM     => 'lib/Blort.pm',
    ABSTRACT_FROM    => 'lib/Blort.pm',
    LICENSE          => 'artistic_2',
    PL_FILES         => {},
    MIN_PERL_VERSION => 5.010,
    CONFIGURE_REQUIRES => {
        'ExtUtils::MakeMaker' => 0,
    },
    BUILD_REQUIRES => {
        'Test::More' => 0,
        'Statistics::Descriptive' => "3.06",
        'rlib' => "0",
    },
    PREREQ_PM => {
        'Task::Biodiverse::NoGUI' => 0,
    },
    dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    #clean => { FILES => 'Statistics-Descriptive-PDL-*' },
);
