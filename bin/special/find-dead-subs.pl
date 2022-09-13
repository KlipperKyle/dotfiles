#!/usr/bin/env perl
#
# find-dead-subs.pl - Print a list of unused subs in one or more perl
# scripts.  This requires exhuberant ctags.
#
# Usage: find-dead-subs <wubble.pl> ...

use strict;
use warnings;

if (scalar @ARGV < 1) {
    die "ERROR: Specify at least one file to search."
}

my $MULTI_FILE = scalar @ARGV > 1;

foreach my $f (@ARGV) {
    if (!-r $f) {
	print STDERR "WARN: Cannot read file $f\n";
	next;
    }
    open (my $tags, "-|", "ctags -ef- '$f'")
      or die "ERROR: Cannot generate tagfile from $f.  Is ctags installed?";
    while (my $tag = <$tags>) {
	chomp $tag;
	if ($tag =~ /^sub (\S+) /) {
	    my $sym = $1;
	    my $refs = 0;
	    open(my $fh, "<", $f) or die "Cannot open $f";
	    while (<$fh>) {
		chomp;
		$refs++ if ($_ =~ /\b$sym\b/
				&& $_ !~ /sub +$sym/
				&& $_ !~ /#.*$sym/);
	    }
	    close($fh);
	    #print "$f::$sym $refs\n";
	    if ($refs == 0) {
		print $MULTI_FILE ? "$f::$sym\n" : "$sym\n";
	    }
	}
    }
}

