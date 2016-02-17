#!/usr/bin/perl
#
# Converts the users keystrokes into hex hashcodes which are then used to change the color
#

use strict;
use warnings;

use Term::ReadKey;
use Digest::MD5 qw(md5_hex);

my $blink1toolpath = "./blink1-tool";
$blink1toolpath = $ARGV[0] if( $ARGV[0] );
die "no blink1-tool at $blink1toolpath\n" if( ! -f $blink1toolpath );

ReadMode 4;
END { ReadMode 0 }

print "q to quit";

my $control = "";

while (1) {
    while (defined (my $key = ReadKey(-1))) {
        exit 0          if $key eq 'q';
        $control .= $key;
    }
    $control = substr(md5_hex($control), 0, 6);
	print `$blink1toolpath -m 1000 --rgb=#$control`;	
    $control = "";
    sleep 1;
}