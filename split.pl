#!/bin/env perl
use strict;
use warnings;

my $lines = 0;

my $limit = shift @ARGV;
my $file = shift @ARGV;

$limit *= 1;

my @seq1 = ('a'..'z');

my ($i, $j) = (0,0);
my $fh;

while (<>){
	if ($lines % $limit == 0)
	{
		if ($fh)
		{
			close ($fh);
		}
		unless ($seq1[$j]){
			$j = 0;
			$i++;
		}
		my $fn = "${file}_" . $seq1[$i].$seq1[$j++];
		
		open ($fh, ">", "$fn")
			or die "Unable to open $fn";
	}
	print $fh $_;
	$lines++;
}

close ($fh);
