#!/usr/bin/perl
use strict;
use warnings;

####################################################
## Daniel Pass | github.com/passdan | August 2016 ##
####################################################

# Print to the screen slower for effect!
$| = 1;

my %sequenceDB;

# # Load Database
# print "Which Database to load:\n- GuessWho\n- Mars\n---\n";
# my $dbchoice = <STDIN>;
# chomp($dbchoice);
# exit 0 if ($dbchoice eq ""); # If empty string, exit.

# if(lc $dbchoice eq lc "GuessWho"){
#   print "Loading Guess Who database!\n";sleep(1);
loadGuessWhoDB();
# }elsif(lc $dbchoice eq lc "Mars"){
#   print "Loading Mars database!\n";sleep(1);
#   loadMarsDB();
# }else{
# print "I didn't understand that choice, exiting\n";
# exit 0
# }

# print "Gene options are:\n";
# foreach my $key (sort { $sequenceDB{$a} cmp $sequenceDB{$b} } keys %sequenceDB){
#   print "$key\t$sequenceDB{$key}\n";
#   select(undef, undef, undef, 0.1);
# }
# sleep(2);

my $prompt = "
O       o O       o O       o
| O   o | | O   o | | O   o |
| | O | | | | O | | | | O | |
| o   O | | o   O | | o   O |
o       O o       O o       O

TOP SECRET!!

GEEF HIERONDER JE DNA CODE IN


Input: ";

system("clear");
print $prompt;

while (my $seq = <STDIN>){
  chomp($seq);
  if (exists $sequenceDB{$seq}){
    my $n = 0;
    print "Searching: 0%"; sleep(1);
    while ($n < 100){ $n+=25; print "----$n%";sleep(1);};
    my $genestring = $sequenceDB{$seq};
    # Guess Who return line
    # if (lc $dbchoice eq lc "GuessWho"){
    print "\n\nDeze DNA code betekent:  "; sleep(1);
    # # Mars return line
    # }elsif(lc $dbchoice eq lc "Mars"){
	  #   print "\n\nThis DNA sequence is most similar to : "; sleep(1);
    # }
    foreach (split //, $genestring){
      print;
      select(undef, undef, undef, 0.1);
    }
    print "!\n";
    sleep(1);
    restart();
  }else{
    sleep(1);
    print "\nOeps, deze DNA code bestaat niet! Probeer het opnieuw.\n";
    sleep(1);
    restart();
  }
}

sub restart {
  print "\n~~~Druk op enter om een nieuwe code te ontcijferen~~~\n";
  while (my $in = <STDIN>){
   if($in eq "\n"){
     system("clear");
     print $prompt;
     return;
   }
  }
}

sub loadGuessWhoDB {

  %sequenceDB = (
  TAGTGGAGCATC => "Lichte huidskleur",      #Ears
  CGGAATAACATG => "Donkere huidskleur",      #Ears
  CCAGTGGATGGC => "Bruine ogen",             #Eyes
  AGTCCAGTGGTA => "Blauwe ogen",              #Eyes
  CAGCGGTTGCTA => "Groene ogen",             #Eyes
  GGGACATTCCTG => "Krullend haar",             #Hair Type
  TTAGCCGCAACG => "Stijl haar",          #Hair Type
  TATGTTGAAGGC => "Blond haar",            #Hair Colour
  AACTCCCGGATA => "Bruin haar",             #Hair Colour
  TGATAGACTGGC => "Zwart haar",             #Hair Colour
  CCACTGGATCTA => "Rood haar",            #Hair Colour
  GTGATGCCGTGG => "Jongen",                    #Sex
  AATACACCCGTG => "Meisje",                   #Sex
  GAGTAACGCATC => "Draagt geen bril",    #Eyesight
  GTCTCCGATATG => "Heeft een bril nodig"           #Eyesight
  );
  return;
}

# sub loadMarsDB {

#   %sequenceDB = (
#   TAGTGGAGCATC => "",      #Ears
#   CGGAATAACATG => "Unknown Species!",      #Ears
#   CCAGTGGATGGC => "Methanosarcina barkeri",             #Eyes
#   AGTCCAGTGGTA => "Yersinia pestis",              #Eyes
#   CAGCGGTTGCTA => "Ulva intestinalis",             #Eyes
#   GGGACATTCCTG => "",             #Hair Type
#   TTAGCCGCAACG => "Homo Sapien",          #Hair Type
#   TATGTTGAAGGC => "Bradyrhizobium japonicum",            #Hair Colour
#   AACTCCCGGATA => "Cyanobacteria",             #Hair Colour
#   TGATAGACTGGC => "Campylobacter jejuni",             #Hair Colour
#   CCACTGGATCTA => "Salmonela enterica",            #Hair Colour
#   GTGATGCCGTGG => "",                    #Sex
#   AATACACCCGTG => "Agaricus bisporus",                   #Sex
#   GAGTAACGCATC => "Influenza",    #Eyesight
#   ATCGTTGGCGAC => "Homo sapien"           #Eyesight
#   );
#   return;
# }
