use 5.008;
use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name           => 'FTL_FleetOps',
    license               => 'mit',
    dist_author           => q{Leam Hall <leamhall@gmail.com>},
    dist_version_from     => 'lib/FTL_FleetOps.pm',
    release_status        => 'stable',
    configure_requires    => {
        'Module::Build'   => '0',
    },
    build_requires        => {
        'Test::More'      => '0',
    },
    requires => {
        #'ABC'              => '1.6',
        #'Foo::Bar::Module' => '5.0401',
    },
    add_to_cleanup        => [ '.-*' ],
    recursive_test_files  => 1,
);

$builder->create_build_script();
