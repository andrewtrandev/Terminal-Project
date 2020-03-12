#ruby gems dictionary
#searches internet to see if word exists
#points system
#output score onto ttext file and read it at start game
#could also have a play again function

require 'ruby_figlet'
require 'dictionary_lookup'
require 'tty-prompt'
require 'tty-box'
prompt=TTY::Prompt.new
require 'colorize'
require_relative "./scrabblescore.rb"
# [:black, :light_black, :red, :light_red, :green, :light_green, :yellow, :light_yellow, :blue, 
#     :light_blue, :magenta, :light_magnenta, :cyan, :light_cyan, :white, :light_white, :default]

play_game=true
score=0
games_played=0

while play_game==true
    system "clear"
    puts (RubyFiglet::Figlet.new("Terminal Scrabble").to_s).colorize(:blue)
    puts " "
    puts TTY::Box.frame "Please try to come up with the longest word possible:".colorize(:red),padding:0.5, align: :center
    #input for how many letters to scramble
    puts " "
    
   
    numberofletters=prompt.ask("Please pick how many letters you would like to scramble (2-20 letters):") do |q|
        q.in '2-20'
        q.messages[:range?]= '%{value} is out of the expected range of 2-20 letters'
         end
         
         system "clear"
    numberofletters= numberofletters.to_i

 
    def lettershuffle(numberofletters)
         #incase there is no vowels, vowel adder
        if numberofletters< 6 
        #for letters a to z > convert to array and shuffle 
        letters =('a'..'z').to_a.shuffle[0,(numberofletters-1)]
        vowels = ['a', 'i', 'o', 'e', 'u'].shuffle[0]
        else
            letters =('a'..'z').to_a.shuffle[0,(numberofletters-2)]
            vowels = ['a', 'i', 'o', 'e', 'u'].shuffle[0..1]
        end
        return vowels + letters  
    end

    #assign randomletters using method
    randomletters=lettershuffle(numberofletters)
    

    def wordcollect()
    puts "\nPlease enter the longest word you can think of,".colorize(:red) 
    puts "using the above letters:".colorize(:red)
    return gets.chomp
    end
    

    def wordcheck(userinput, randomletters)
        index=0
        for letter in userinput
            #if randomletters had the letter inside
            if randomletters.include?(letter)
               
            randomletters.delete_at(randomletters.index(letter))
            # p randomletterscheck
            index+=1
            
            # p index
            else
                puts "\nNot a valid word!".colorize(:yellow)
                return false
                
            end
        
        end
        return true 
    end

    validword=false
    while validword == false do
    puts " "
    print randomletters
     userinput=wordcollect()
     validword=wordcheck(userinput, randomletters)
    end

    #results = check dictionary gem to see if word can be defined
    #feed user input in that checks with dictionary
    #sanitize inputs for get rid of numbers and odd characters?
    results = DictionaryLookup::Base.define(userinput)
 
    # p userinput.split.pop == 's'
    #word length = points length
    #if empty array then no points
    #if answer is not equal to empty array then award userinput.length as points
    
    if results != [] && validword==true
        
        puts "\nCongratulations you win #{Scrabble.score(userinput)} points".colorize(:light_green)
        puts 
        score = score+(Scrabble.score(userinput))
        puts "Final Score:#{score}".colorize(:black).colorize(:background =>:yellow)
        games_played+=1
        puts "Games played:#{games_played}"
        puts "Score per game:#{(score.to_f/games_played.to_f).round(2)}"
    else
        puts "No points".colorize(:light_magenta)
        puts "Final Score:#{score}".colorize(:black).colorize(:background =>:yellow)
        games_played+=1
        puts "Games played:#{games_played}"
        puts "Score per game:#{(score.to_f/games_played.to_f).round(2)}"
    end

        # puts "Would you like to play again? (y/n)".colorize(:yellow)
        play_game = prompt.select("\nWould you like to play again?", %w(Yes No))
        #ternary if userinput = y go back to top and continue running game
        if play_game == 'Yes' ? play_game=true : play_game=false
           
        end
  
end
