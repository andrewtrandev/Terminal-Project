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
#could also have a play again function


require 'dictionary_lookup'
p "Welcome to terminal scrabble,"
p   "please try to come up with the longest word possible"
p   "for the most points"
p "How many letters would you like to scramble?"
numberofletters=gets.chomp


#returns an array of shuffle letters
#should turn into function?
def lettershuffle(numberofletters)
    letters =('a'..'z').to_a.shuffle[0,numberofletters.to_i].join
    return letters
end

p lettershuffle(numberofletters)

#results = check dictionary gem to see if word can be defined
#feed user input in that checks with dictionary
#sanitize inputs for get rid of numbers and odd characters?
results = DictionaryLookup::Base.define("hellop")
#word length = points length
#if empty array then no points
p results