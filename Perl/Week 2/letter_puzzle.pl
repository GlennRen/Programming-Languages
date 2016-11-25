use strict;
use warnings;

# create new hash
my %question_answers = ();

# open file 'test.txt' for reading
# file handle = $wordlist
my $filename = "words.txt";
open(my $wordlist, '<:encoding(UTF-8)', $filename)
  or die "Could not open file '$filename' $!";

# open file 'questions' for writing
# file handle = $qh
open(my $qh, '>', 'questions');
# open file 'answers' for writing
# file handle = $ah
open(my $ah, '>', 'answers');

# iterate over every line in $wordlist
while (my $word = <$wordlist>) {
  chomp $word;
  my $word_len = length $word;

  # iterate over every sequence of 4 letters in the word
  for my $i(0..$word_len-4) {
    my $current_seq = substr $word, $i, 4;

    # check if the current sequence is unique
    if (not (exists($question_answers{$current_seq}))) {
      $question_answers{$current_seq} = "$word";
      print "$current_seq  $word\n";
      # append current sequence to 'question'
      print $qh "$current_seq\n";
      # append current word to 'answer'
      print $ah "$word\n";
    }
  }
}

close $qh;
close $ah;
