use 5.008;
use strict;
use warnings;

package Text::UpsideDown;
# ABSTRACT: Flip text upside-down using Unicode
use charnames ':full';
use Exporter qw(import);
our @EXPORT  = ('upside_down');

# mapping taken from
# http://www.fileformat.info/convert/text/upside-down-map.htm
#
# Letters that don't change in upside-down view (like 'H', 'I') aren't given.
our %upside_down_map = (
    '!' => "\N{INVERTED EXCLAMATION MARK}",
    '"' => "\N{DOUBLE LOW-9 QUOTATION MARK}",
    '&' => "\N{TURNED AMPERSAND}",
    "'" => ',',
    '(' => "\N{RIGHT PARENTHESIS}",
    '.' => "\N{DOT ABOVE}",
    '/' => '\\',
    '3' => "\N{LATIN CAPITAL LETTER OPEN E}",
    '6' => '9',

    # '7' => "\N{LATIN CAPITAL LETTER L WITH MIDDLE TILDE}",
    ';'            => "\N{ARABIC SEMICOLON}",
    '<'            => '>',
    '?'            => "\N{INVERTED QUESTION MARK}",
    'A'            => "\N{FOR ALL}",
    'B'            => "\N{GREEK SMALL LETTER XI}",
    'C'            => "\N{ROMAN NUMERAL REVERSED ONE HUNDRED}",
    'D'            => "\N{LEFT HALF BLACK CIRCLE}",
    'E'            => "\N{LATIN CAPITAL LETTER REVERSED E}",
    'F'            => "\N{TURNED CAPITAL F}",
    'G'            => "\N{TURNED SANS-SERIF CAPITAL G}",
    'J'            => "\N{LATIN SMALL LETTER LONG S}",
    'K'            => "\N{RIGHT NORMAL FACTOR SEMIDIRECT PRODUCT}",
    'L'            => "\N{TURNED SANS-SERIF CAPITAL L}",
    'M'            => 'W',
    'N'            => "\N{LATIN LETTER SMALL CAPITAL REVERSED N}",
    'P'            => "\N{CYRILLIC CAPITAL LETTER KOMI DE}",
    'Q'            => "\N{GREEK CAPITAL LETTER OMICRON WITH TONOS}",
    'R'            => "\N{LATIN LETTER SMALL CAPITAL TURNED R}",
    'T'            => "\N{UP TACK}",
    'U'            => "\N{INTERSECTION}",
    'V'            => "\N{GREEK LETTER SMALL CAPITAL LAMDA}",
    'Y'            => "\N{TURNED SANS-SERIF CAPITAL Y}",
    '['            => ']',
    '_'            => "\N{OVERLINE}",
    'a'            => "\N{LATIN SMALL LETTER TURNED A}",
    'b'            => 'q',
    'c'            => "\N{LATIN SMALL LETTER OPEN O}",
    'd'            => 'p',
    'e'            => "\N{LATIN SMALL LETTER TURNED E}",
    'f'            => "\N{LATIN SMALL LETTER DOTLESS J WITH STROKE}",
    'g'            => "\N{LATIN SMALL LETTER B WITH TOPBAR}",
    'h'            => "\N{LATIN SMALL LETTER TURNED H}",
    'i'            => "\N{LATIN SMALL LETTER DOTLESS I}",
    'j'            => "\N{LATIN SMALL LETTER R WITH FISHHOOK}",
    'k'            => "\N{LATIN SMALL LETTER TURNED K}",
    'l'            => "\N{LATIN SMALL LETTER ESH}",
    'm'            => "\N{LATIN SMALL LETTER TURNED M}",
    'n'            => 'u',
    'r'            => "\N{LATIN SMALL LETTER TURNED R}",
    't'            => "\N{LATIN SMALL LETTER TURNED T}",
    'v'            => "\N{LATIN SMALL LETTER TURNED V}",
    'w'            => "\N{LATIN SMALL LETTER TURNED W}",
    'y'            => "\N{LATIN SMALL LETTER TURNED Y}",
    '{'            => '}',
    "\N{UNDERTIE}" => "\N{CHARACTER TIE}",
    "\N{LEFT SQUARE BRACKET WITH QUILL}" =>
      "\N{RIGHT SQUARE BRACKET WITH QUILL}",
    "\N{THEREFORE}" => "\N{BECAUSE}",
);
%upside_down_map = (%upside_down_map, reverse %upside_down_map);

sub upside_down {
    my $text = shift;
    $text =~ s/(.)/ exists $upside_down_map{$1} ? $upside_down_map{$1} : $1/ge;
    join '' => reverse split '', $text;
}
1;

=head1 SYNOPSIS

    use Text::UpsideDown;
    print upside_down("marcel gruenauer");

=head1 DESCRIPTION

This module exports only one function.

=function upside_down

Takes a string and returns a string that looks like the characters have been
turned upside-down and reversed so it could be read by turning your head
upside-down. It uses special Unicode characters originally intended for
mathematics and the like.
