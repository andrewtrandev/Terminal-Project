# vowels = ['a', 'i', 'o', 'e', 'u'].shuffle[1]
# vowels2 = ['a', 'i', 'o', 'e', 'u'].shuffle[0..4]  #what does this modifier even do // returns nil at 5, ohhh it must shuffle the array and return
# #whatever that index position is
# vowels3 = ('a'..'z').to_a.shuffle[0,4] 

require "tty-prompt"
require "ruby_figlet"
prompt=TTY::Prompt.new
require "lolcat"
require "tty-box"
require 'dictionary_lookup'
require 'colorize'


# puts  TTY::Box.frame "Please try to come up with the longest word possible", padding: 1, align: :center

p scrabble-solver | test
# puts RubyFiglet::Figlet.new("meow...").to_s
# # p vowels
# # p vowels2
# p vowels3

# # result=prompt.ask("Please pick 2 - 12 letters?") do |q|
# #     q.in '2-12'
# #     q.messages[:range?]= '%{value} out of expected range'
# #      end
    

# # p result

    
# userinput=prompt.ask("Please enter the longest word you can think of:") do |q|
# q.required true
#   q.validate /\A\w+\Z/
#   q.modify   :downcase
#     end


# userinput = "hellos"
#     p userinput
   
     
#     results = DictionaryLookup::Base.define(userinput)
 
#     p userinput.split.pop == 's'
#     #word length = points length
#     #if empty array then no points
#     #if answer is not equal to empty array then award userinput.length as points
    
#     if results != [] && validword==true
#         puts "Congratulations you win #{userinput.length} points".colorize(:light_green)
        
#         score = score+(userinput.length.to_i)
#         puts "Final Score:#{score}".colorize(:black).colorize(:background =>:yellow)
        
#     else
#         puts "No points".colorize(:light_magenta)
#         puts "Final Score:#{score}".colorize(:black).colorize(:background =>:yellow)
#     end

#         puts "Would you like to play again? (y/n)".colorize(:yellow)
#         play_game = gets.chomp
#         #ternary if userinput = y go back to top and continue running game
#         if play_game == 'y' ? play_game=true : play_game=false
#         end


