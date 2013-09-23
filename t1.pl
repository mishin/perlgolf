#!/usr/bin/env perl
#!perl
# http://pointsgame.narod.ru/
use Modern::Perl;
use utf8;
use DDP;

my $data = &read_DATA( join '', <DATA> );
my @golf = split /\n/, $data->{'Perl_Golf'};
my @data;

# push @data, [split //] for @golf;
for (@golf) {
    push @data, [ split // ];
}
p @data;

# p @golf;

sub read_DATA {
    my $string = shift;
    print {*STDERR} "Reading from __DATA__...\n";
    my %contents_of =
      do { local $/; "", split /_____\[ (\S+) \]_+\n/, $string };
    for ( values %contents_of ) {
        # s/^!=([a-z])/=$1/gxms;
        s/^!=(\w+)/=$1/gxms;
    }
    print {*STDERR} "done\n";
    return \%contents_of;
}
__END__
__DATA__
_____[ Perl_Golf ]________________________________________________
         
         
         
         
         
         
         
         
         
       bw
_____[ Идеи_и_Решения ]________________________________________________
Решение задачи Го
1) берем белую точку и измеряем расстяния до черных в пределах 
2) цепь замкнута, то есть каждая из точек имеет соседнюю.
3) Среднее расстояние меньше, чем половина расстояния до самой дальней