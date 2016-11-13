# http://www.perl.com/pub/2000/10/begperl1.html
print "Perl!\n";

# Functions and Statements
print "Look,", " a ", "list!\n";
print "This is "; print "two statements.\n"; print "But this ",
"is only one statement.\n";

# Different Types of Quotes
print "This string\nappears on two lines!\n"; # interpreted
print 'This string\n appears on only one.'; # taken literally

# Variables
# 3 types: scalars, arrays & hashes
# scalars
$apple_count = 5;
$orange_count = 2;
$people = 3;
$fruit_report = "There are $apple_count apples, $orange_count oranges, and $people people.";
print "\nThe report is: $fruit_report\n";

#special operators
$a = 5;
$a++;
$a += 10;
$a /= 2;
print ("$a\n");

# arrays
@lotto_numbers = (1, 2, 3, 4, 5, 6);
@months = ("July", "August", "September");
$months[1] = "Feburary";
$basketball_players[0] = "Lebron James";
$months_count =  $#months;

# hashes
%days_in_summer = ("July" => 31, "August" => 31, "September" => 30);
$days_in_july = $days_in_summer{"July"};
$days_in_summer{"October"} = 31;
@month_list = keys %days_in_summer;


# Loops
for $i (@month_list) {
  print "$i\n";
}
