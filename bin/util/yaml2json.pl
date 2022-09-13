#!/usr/bin/env perl
#
# yaml2json → perl version
#
# Read several YAML documents and print the equivalent JSON.
#

# https://www.commandlinefu.com/commands/view/12218/convert-yaml-to-json
use YAML::XS qw( LoadFile );
use JSON::XS qw( encode_json );
for (@ARGV) {
	for (LoadFile($_)) {
		print encode_json($_),"\n"
	}
}
