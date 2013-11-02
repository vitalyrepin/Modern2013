#!/usr/bin/perl

# Finds unencoded URLs in TeX sources (commands \attrib and encodes them
use strict;
use utf8;
use open qw(:std :utf8);
use URI::Encode;

my $fname="../ack.tex";
open( my $fh, '<', $fname ) or die "Couldn't open $fname for reading: $!\n";

my $uri     = URI::Encode->new( { encode_reserved => 0 } );

while (defined(my $line = <$fh>) ) {
    chomp $line;
    if($line =~ m/^\s*\\attrib\{([^}]+)}\{([^}]+)\}\{(.*)/)
    {
      my $url = $2;
      my $fr=$1; my $ls = $3;
      if($url =~ m/%/) {  # Already encoded. Real mess!
      	print $line . "\n";
      } else {
        $url = $uri->encode($url);
	# We will need to put url as argument to LaTeX command. "%" shall be escaped by "\"
        $url =~ s/%/\\%/g;

        print "\\attrib{$fr}{$url}{$ls\n";
     }
    } else {
      print $line . "\n"
    };
}
