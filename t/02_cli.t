#!/usr/bin/env perl
use strict;
use warnings;
use utf8;
use open qw(:std :encoding(UTF-8));
use Text::UpsideDown;
use Test::More tests => 2;

note 'upside down args'; {
    my $ud = qx{$^X bin/ud hello};
    $ud =~ s/^\n|\n$//g; #trim

    is
        $ud,
        'oʃʃǝɥ',
        'upside down on command line';
}

note 'stdin'; {
    my $ud = `echo hello | $^X bin/ud 2>&1`;
    $ud =~ s/^\n|\n$//g; # trim

    is
        $ud,
        'oʃʃǝɥ',
        'upside down on stdin';
}
