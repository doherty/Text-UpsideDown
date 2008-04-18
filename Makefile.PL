use inc::Module::Install;
name 'Text-UpsideDown';
all_from 'lib/Text/UpsideDown.pm';
perl_version '5.006';

build_requires 'Test::More' => '0.70';

use_standard_tests(without => 'pod_coverage');
auto_include;
WriteAll;
