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
require 'dictionary_lookup'
require 'tty-prompt'
prompt=TTY::Prompt.new
require 'colorize'
# [:black, :light_black, :red, :light_red, :green, :light_green, :yellow, :light_yellow, :blue, 
#     :light_blue, :magenta, :light_magenta, :cyan, :light_cyan, :white, :light_white, :default]

play_game=true

while play_game==true

    puts "Welcome to terminal scrabble,".colorize(:blue)
    puts  "please try to come up with the longest word possible".colorize(:blue)
    puts  "for the most points".colorize(:blue)
    puts "How many letters would you like to scramble?".colorize(:blue)
    #input for how many letters to scramble
    
    numberofletters=prompt.ask("Please pick 2 - 12 letters?") do |q|
        q.in '2-12'
        q.messages[:range?]= '%{value} out of expected range'
         end

    numberofletters= numberofletters.to_i

    #returns an array of shuffle letters
    #should turn into function?
    #at the moment it's only shuffling 1 set of 26 letters
    def lettershuffle(numberofletters)
        

        #incase there is no vowels, vowel adder
        if numberofletters< 6 
        #for letters a to z > convert to array and shuffle 
        letters =('a'..'z').to_a.shuffle[0,(numberofletters-1)].join
        vowels = ['a', 'i', 'o', 'e', 'u'].shuffle[0]
        else
            letters =('a'..'z').to_a.shuffle[0,(numberofletters-2)].join
            vowels = ['a', 'i', 'o', 'e', 'u'].shuffle[0..1].join
        end
        p vowels
        p letters
        return vowels + letters  
    end

    #assign randomletters using method
    p randomletters=lettershuffle(numberofletters)
    puts "Please enter the longest word you can think of".colorize(:red)
    
    # validword=true
    # if validword == true


    userinput = gets.chomp
        
    #split the userinput into an array
    userinputcheck = userinput.split("")
    randomletterscheck=randomletters.split("")
    #for each object in userinput check
    p randomletterscheck
    p userinputcheck
    
    validword = true
    for letter in userinputcheck
        #if randomletters had the letter inside
        if randomletterscheck.include?(letter)
           randomletterscheck.delete(letter)
        else
            puts "Not a valid word!".colorize(:yellow)
            validword=false
            break
        end
    end

    # while !check_word(users_hand, word)
    #     print "enter a valid word"
    # end
    
    #need to check if userinput is included within random letters
    

    #results = check dictionary gem to see if word can be defined
    #feed user input in that checks with dictionary
    #sanitize inputs for get rid of numbers and odd characters?

    results = DictionaryLookup::Base.define(userinput)
    results2 = DictionaryLookup::Base.define(userinput.chop) #chop cuts off the last character

    #word length = points length
    #if empty array then no points
    #if answer is not equal to empty array then award userinput.length as points
    
    if results != [] || results2!=[]
        puts "Congratulations you win #{userinput.length} points".colorize(:black).colorize(:background =>:yellow)
        score = userinput.length
        puts "score:#{score}"
    else
        puts "No points".colorize(:light_magenta)
    end

        puts "Would you like to play again? (y/n)".colorize(:yellow)
        play_game = gets.chomp
        #ternary if userinput = y go back to top and continue running game
        if play_game == 'y' ? play_game=true : play_game=false
        end

end
