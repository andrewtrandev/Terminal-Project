#scrabble game
#presented with random letters
#longer word lengths win
#determine how many games to play?
#how to check if words are correct?

#app gives random amount of letters

#ruby gems dictionary

#searches internet to see if word exists
#points system
#output score onto text file and read it at start game


require 'dictionary_lookup'
results = DictionaryLookup::Base.define("hellop")
p results