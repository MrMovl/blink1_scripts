#!/usr/bin/env perl
#
# Inspired by http://whatcolourisit.scn9a.org/
#
# changes color to the hex representation of the current 
# time (while taking the day of the week into account)
#

use Time::Piece;

my $blink1toolpath = "./blink1-tool";
$blink1toolpath = $ARGV[0] if( $ARGV[0] );

die "no blink1-tool at $blink1toolpath\n" if( ! -f $blink1toolpath );

while(true) {
	my $time = localtime;
	my ($r,$g,$b, $offset) = ($time->hour, $time->min, $time->sec, $time->day_of_week);
	$r = $r + (10 * $offset);

	print "$time\t";
	print `$blink1toolpath --rgb 0x$r,0x$g,0x$b`;	
}

