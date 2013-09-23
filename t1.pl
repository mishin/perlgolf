#!/usr/bin/env perl
#!perl
use Modern::Perl;
use DDP;
my $data = &read_DATA( join '', <DATA> );
my $golf = $data->{Perl_Golf};

# p $data;
p $golf;

sub read_DATA {
    my $string = shift;
    print {*STDERR} "Reading from __DATA__...\n";
    my %contents_of =
      do { local $/; "", split /_____\[ (\S+) \]_+\n/, $string };
    for ( values %contents_of ) {
        s/^!=([a-z])/=$1/gxms;
    }
    print {*STDERR} "done\n";
    return \%contents_of;
}
__END__
__DATA__
_____[ Perl_Golf ]________________________________________________
         
         
         
         
         
         
         
         
         
       bw
