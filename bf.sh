#!/usr/bin/perl
use File::Slurp;
use Getopt::Long;   

my $in = read_file($ARGV[0]);
GetOptions('debug' => \$debug);

my @in = split("", $in);
$in =~ s/[^\[\]<>.+-]//g;
my @in = split("", $in);

my @array = ();
my $pointer = 0;
my $offset = 0;
my @old_offset;

while($offset ne $#in+1){
    $s = $in[$offset];
    $x = $debug;

    if ($s eq '>')
    {
        $pointer++;
    }
    elsif($s eq '+')
    {
        $array[$pointer] = ($array[$pointer] + 1) % 256;
    }
    elsif($s eq '-')
    {
        $array[$pointer] = ($array[$pointer] - 1) % 256;
    }
    elsif($s eq '<')
    {
        $pointer--;
    }
    elsif($s eq '[')
    {
        push(@old_offset, $offset);
    }
    elsif($s eq ']')
    {
        if ($array[$parent] != 0)
        {
            $offset = pop(@old_offset);
            push(@old_offset, $offset);
        }
        else
        {
            pop(@old_offset);
        }
    }
    elsif($s eq '.')
    {
        print chr($array[$pointer]), "\n";
    }
    else
    {
        $x = 0;
    }

    if ($x)
    {
        # DEBUG:
        print "OP: ", $s, " pointer: ", $pointer, " off: ", $offset;
        print " memory: ", join(", ", @array), "\n";
    }
    $offset += 1;
}