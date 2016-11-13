use strict;
use warnings;
use POSIX;

my @random_nums = ();
for my $i(0..9) {
  push @random_nums, rand(360);
};

for my $i(0..$#random_nums) {
  my $current = $random_nums[$i];
  # rounding
  my $round = sprintf("%.2f", $current);
  my $trunc = int($current*100)/100;
  my $ceil = ceil($current);
  my $floor = floor($current);
  # roots
  my $square_root = sprintf("%.2f", sqrt($current));
  my $cube_root = $current ** (1/3);
  # trig
  my $sin = sin($current);
  my $cos = cos($current);
  my $tan = $sin/$cos;
  # other
  my $log = log($current);

  print "Original: $current\n";
  print "Rounded: $round\n";
  print "truncd: $trunc\n";
  print "Ceiling: $ceil\n";
  print "Floor: $floor\n";
  print "Square Root: $square_root\n";
  print "Cube Root: $cube_root\n";
  print "Sine: $sin\n";
  print "Cosine: $cos\n";
  print "Tangent: $tan\n";
  print "Natural Log: $log\n";
  print "\n"
}
