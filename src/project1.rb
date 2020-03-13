require 'ruby_figlet'
require 'dictionary_lookup'
require 'tty-prompt'
require 'tty-box'
prompt=TTY::Prompt.new
require 'colorize'
require_relative "./scrabblescore.rb"

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
    randomletterscheck=randomletters.to_s

    def wordcollect()
    puts "\nPlease enter the longest word you can think of,".colorize(:red) 
    puts "using the above letters:".colorize(:red)
    return gets.chomp
    end
    

    def wordcheck(userinput, randomletters)
        
        for letter in userinput
            #if randomletters had the letter inside
            if randomletters.include?(letter)
               
            randomletters.delete_at(randomletters.index(letter))
            # p randomletterscheck
           
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
     validword=wordcheck(userinput, randomletterscheck)
    end

    #results = check dictionary gem to see if word can be defined
    results = DictionaryLookup::Base.define(userinput)
    #if results is empty array then no points
   
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

