use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'Template::Flute',
    AUTHOR              => q{Stefan Hornburg (Racke) <racke@linuxia.de>},
    VERSION_FROM        => 'lib/Template/Flute.pm',
    ABSTRACT_FROM       => 'lib/Template/Flute.pm',
    ($ExtUtils::MakeMaker::VERSION >= 6.3002
      ? ('LICENSE'=> 'perl')
      : ()),
    PL_FILES            => {},
    BUILD_REQUIRES => {
        'Test::Deep' => 0,
        'Test::More' => 0,
        'Test::Warn' => 0,
        'Test::Warnings' => 0,
        'Test::Fatal' => 0,
    },
    PREREQ_PM => {
        'Data::Transpose' => 0.0009,
        'Path::Tiny' => 0,
        'XML::Twig' => 3.48,
        'HTML::TreeBuilder' => 0,
        'Parse::RecDescent' => 0,
        'Moo' => 1.001000,
        'Scalar::Util' => 0,
        'URI' => 0,
    },
    EXE_FILES => [ 'scripts/flute' ],
    META_MERGE        => {
        resources => {
            repository  => 'https://github.com/racke/Template-Flute.git',
            bugtracker  => 'https://github.com/racke/Template-Flute/issues',
        },
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Template-Flute-*' },
    test                => { TESTS => join( ' ', (glob( 't/*.t'), glob('t/*/*.t')))},
);
