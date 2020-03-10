#scrabble game
#presented with random letters
#longer word lengths win
#determine how many games to play?
#how to check if words are correct?

#app gives random amount of letters

#ruby gems dictionary

#searches internet to see if word exists
#points system
#output score onto ttext file and read it at start game
#could also have a play again function

play_game=true
while play_game==true

require 'dictionary_lookup'


p "Welcome to terminal scrabble,"
p   "please try to come up with the longest word possible"
p   "for the most points"
p "How many letters would you like to scramble?"
#input for how many letters to scramble
numberofletters=gets.chomp


#returns an array of shuffle letters
#should turn into function?
#at the moment it's only shuffling 1 set of 26 letters
def lettershuffle(numberofletters)
    letters =('a'..'z').to_a.shuffle[0,((numberofletters.to_i)-1)].join
    #incase there is no vowels
    vowels = ['a', 'i', 'o', 'e', 'u'].shuffle[1]
    # p vowels
    # p letters
    return vowels + letters  
end

#assign randomletters using method
p randomletters=lettershuffle(numberofletters)
p "Please enter the longest word you can think of"
userinput = gets.chomp

# if userinput.split.compare  


#results = check dictionary gem to see if word can be defined
#feed user input in that checks with dictionary
#sanitize inputs for get rid of numbers and odd characters?


results = DictionaryLookup::Base.define(userinput)

results2 = DictionaryLookup::Base.define(userinput.chop) #chop cuts off the last character
p userinput.chop
#word length = points length
#if empty array then no points

if results != [] || results2!=[]
    p "Congratulations you win #{userinput.length} points"
else
    p "No points"
end

    p "Would you like to play again? (y/n)"
    play_game = gets.chomp
    if play_game == 'y' ? play_game=true : play_game=false
    end

end