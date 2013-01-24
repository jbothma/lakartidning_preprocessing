#!/usr/bin/perl
while($line = <>) {
    $line =~ s/-\n//g;
    #$line =~ s/\n/ /;
    $line =~ s/  +/ /g;
    $line =~ s/[^\s\w -.;?!,öäåÖÄÅ]//g;
    $line =~ s/(\w)\?+/$1?/g;
    $line =~ s/\W+[\?!]+//g;
    print "$line";
}
