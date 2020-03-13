require 'ruby_figlet'
require 'dictionary_lookup'
require 'tty-prompt'
require 'tty-box'
prompt=TTY::Prompt.new
require 'colorize'
<<<<<<< Updated upstream
require_relative "./scrabblescore.rb" #someone else's scrabble score hash
=======
require_relative "./scrabblescore.rb"
>>>>>>> Stashed changes


play_game=true
score=0
games_played=0

while play_game==true
    system "clear"   
    puts (RubyFiglet::Figlet.new("Word Scramble").to_s).colorize(:blue)   #big ascii text
    puts " "
    puts TTY::Box.frame "Please try to come up with the longest word possible:".colorize(:red),padding:0.5, align: :center
    puts " "
    
    numberofletters=prompt.ask("Please pick how many letters you would like to scramble (2-20 letters):") do |q|
        q.in '2-20'     #accepts 2-20 as range
        q.messages[:range?]= '%{value} is out of the expected range of 2-20 letters' #displays as error message
    end        
         
         system "clear"
    numberofletters= numberofletters.to_i

 
    def lettershuffle(numberofletters)
         #incase there is no vowels, vowel adder
        if numberofletters < 6 
        #for letters a to z > convert to array and shuffle 
        letters =('a'..'z').to_a.shuffle[0,(numberofletters-1)]
        vowels = ['a', 'i', 'o', 'e', 'u'].shuffle[0]
        else #for letters a to z, turn to array, shuffle, output 1 less than number of letters
            letters =('a'..'z').to_a.shuffle[0,(numberofletters-2)]
            vowels = ['a', 'i', 'o', 'e', 'u'].shuffle[0..1]
        end
    return vowels + letters  
    end

<<<<<<< Updated upstream
    #array
    randomletters=lettershuffle(numberofletters) 
    randomletterscheck=randomletters.to_s 
    #double check if when you make two arrays equal they link
    #so when you delete from one, it also deletes from the other
=======
    #assign randomletters using method
    randomletters=lettershuffle(numberofletters)
    randomletterscheck=randomletters.to_s
>>>>>>> Stashed changes

    #collects userinput for word
    def wordcollect()
        puts "\nPlease enter the longest word you can think of,".colorize(:red) 
        puts "using only the above letters:".colorize(:red)
    return gets.chomp.downcase
    end
    

<<<<<<< Updated upstream
    def wordcheck(userinput, randomletterscheck)
        for letter in userinput
            #if randomletters had the letter inside
            if randomletterscheck.include?(letter)
                #was originally using .delete() instead of .delete_at which would delete every instance of the variable 
                #only noticed this because sometimes words like goon wouldn't work    
                randomletterscheck.delete_at(randomletterscheck.index(letter)) #at index of specified letter in
                 #the random letters array, delete it
=======
    def wordcheck(userinputcheck, randomletterscheck)
        index=0
        for letter in userinputcheck
            #if randomletters had the letter inside
            if randomletterscheck.include?(letter)
               
            randomletterscheck.delete_at(randomletterscheck.index(letter))
            # p randomletterscheck
            index+=1
            
            # p index
>>>>>>> Stashed changes
            else
                puts "\nNot a valid word!".colorize(:yellow)
            return false
            end
        end
        return true 
    end

    validword=false
<<<<<<< Updated upstream
        while validword == false do
            puts " "
            print randomletters 
            userinput=wordcollect()
            validword=wordcheck(userinput, randomletterscheck)
        end
=======
    while validword == false do
    puts " "
    print randomletters
     userinput=wordcollect()
     userinputcheck = userinput
     randomletterscheck=randomletters
     validword=wordcheck(userinputcheck, randomletterscheck)
    end
>>>>>>> Stashed changes

    #results = check dictionary gem to see if word can be defined
    results = DictionaryLookup::Base.define(userinput)
    #if empty array then no points

    
    if results != [] && validword==true
        #originally had string.length as points
        puts "\nCongratulations you win #{Scrabble.score(userinput)} points".colorize(:light_green)
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

        play_game = prompt.select("\nWould you like to play again?", %w(Yes No))
        #ternary if userinput = y go back to top and continue running game
        if play_game == 'Yes' ? play_game=true : play_game=false
           
        end
end
