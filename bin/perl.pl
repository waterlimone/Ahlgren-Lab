use strict;
## runs through tab blast output and reports the first hit

my $infile = $ARGV[0];
my $outfile = $ARGV[1];
my $line;
my @info;
my $ph;
my $h;
my $c = 0;
open (IN,$infile) or die "Couldn't open infile: $infile $!\n";
open (OUT,">$outfile") or die "Couldn't open outfile: $outfile $!\n";
$line = <IN>;
chomp $line;
@info = split("\t",$line);
$ph = $info[0];
print OUT $line . "\n";

while ($line = <IN>) {
    chomp $line;
    @info = split("\t",$line);
    $h = $info[0];
    if ($h eq $ph) {
	$c++;
        next;
    }
    else {
        print OUT $line . "\n";
        $ph = $h;
    }
}
print OUT $line;
close IN;
close OUT;

print "Found $c identical 1st hit lines\n";