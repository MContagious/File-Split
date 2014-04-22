#!/bin/env perl

# The MIT License (MIT)

# Copyright (c) 2014 Kishore Relangi

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

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
