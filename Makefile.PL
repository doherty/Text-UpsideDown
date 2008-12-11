use inc::Module::Install;
include 'Module::AutoInstall';

name 'Text-UpsideDown';
all_from 'lib/Text/UpsideDown.pm';
perl_version '5.008';

test_requires 'Test::More' => '0.70';
extra_tests;

auto_install;
auto_include;
WriteAll;
