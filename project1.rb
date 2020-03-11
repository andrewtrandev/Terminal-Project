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
require 'ruby_figlet'
require 'dictionary_lookup'
require 'lolcat'
require 'tty-prompt'
require 'tty-box'
prompt=TTY::Prompt.new
require 'colorize'
# [:black, :light_black, :red, :light_red, :green, :light_green, :yellow, :light_yellow, :blue, 
#     :light_blue, :magenta, :light_magnenta, :cyan, :light_cyan, :white, :light_white, :default]

play_game=true
score=0
while play_game==true
    system "clear"
    puts (RubyFiglet::Figlet.new("Terminal Scrabble").to_s).colorize(:blue)
    puts " "
    puts TTY::Box.frame "Please try to come up with the longest word possible:".colorize(:red),padding:0.5, align: :center
    #input for how many letters to scramble
    puts " "
    
   

    numberofletters=prompt.ask("Please pick how many letters you would like to scramble (2-12 letters):") do |q|
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
        # p vowels
        # p letters
        return vowels + letters  
    end

    #assign randomletters using method
    p randomletters=lettershuffle(numberofletters)
    
    puts "Please enter the longest word you can think of:".colorize(:red)
    userinput = gets.chomp
    
    userinputcheck = userinput.split("")
    randomletterscheck=randomletters.split("")
  
    # p randomletterscheck
    # p userinputcheck

    # continue=false
    # while continue ==false
    def wordcheck(userinputcheck, randomletterscheck)
        for letter in userinputcheck
            #if randomletters had the letter inside
            if randomletterscheck.include?(letter)
            randomletterscheck.delete(letter)
            else
                puts "Not a valid word!".colorize(:yellow)
                return false
                break
            end
        
        end
        return true 
    end
# end
     validword=wordcheck(userinputcheck, randomletterscheck)

    
    
    # while validword == false 

    # while !check_word(users_hand, word)
    #     print "enter a valid word"
    # end
    
    #need to check if userinput is included within random letters
    

    #results = check dictionary gem to see if word can be defined
    #feed user input in that checks with dictionary
    #sanitize inputs for get rid of numbers and odd characters?

    results = DictionaryLookup::Base.define(userinput)
 
    # p userinput.split.pop == 's'
    #word length = points length
    #if empty array then no points
    #if answer is not equal to empty array then award userinput.length as points
    
    if results != [] && validword==true
        puts "Congratulations you win #{userinput.length} points".colorize(:light_green)
        
        score = score+(userinput.length.to_i)
        puts "Final Score:#{score}".colorize(:black).colorize(:background =>:yellow)
        
    else
        puts "No points".colorize(:light_magenta)
        puts "Final Score:#{score}".colorize(:black).colorize(:background =>:yellow)
    end

        puts "Would you like to play again? (y/n)".colorize(:yellow)
        play_game = gets.chomp
        #ternary if userinput = y go back to top and continue running game
        if play_game == 'y' ? play_game=true : play_game=false
        end

end
