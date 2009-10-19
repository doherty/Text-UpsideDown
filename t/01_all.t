#!/usr/bin/env perl
use warnings;
use strict;
use Text::UpsideDown;
use Test::More tests => 1;
my @test = %Text::UpsideDown::upside_down_map;
my ($orig_str, $expect_str) = ('', '');
while (my ($orig, $new) = splice(@test, 0, 2)) {
    $orig_str .= $orig;
    $expect_str = $new . $expect_str;
}
is(upside_down($orig_str), $expect_str, 'string composed form full map');
