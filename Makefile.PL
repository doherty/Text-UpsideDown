use inc::Module::Install;
include 'Module::AutoInstall';

name 'Text-UpsideDown';
all_from 'lib/Text/UpsideDown.pm';
perl_version '5.008';

recommends 'Test::Pod';
recommends 'Test::Pod::Coverage';

test_requires 'Test::More' => '0.70';
test_requires 'Test::Compile';

auto_install;
auto_include;
WriteAll;
