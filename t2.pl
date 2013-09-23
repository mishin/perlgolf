#!/usr/bin/env perl

use warnings; use strict;
use DDP;
my @data;

while (<DATA>) {
    next unless /\S/;
    push @data, [ split ];
}

p @data;
__DATA__
230215 01/16/2000 57533 "" 0 1045403 "" ? 0 0 217623

230215 01/18/2000 77659 "" 0 1045403 "" ? 0 0 217624

230215 01/25/2000 76583 "" 0 1045403 "" ? 0 0 217625

230215 01/29/2000 58082 "" 0 1045403 "" ? 0 0 217626

230216 01/14/2000 50020 "" 0 1045403 "" ? 0 0 217627

230216 01/18/2000 66444 "" 0 1045403 "" ? 0 0 217628

230216 01/19/2000 51330 "" 0 1045403 "" ? 0 0 217629