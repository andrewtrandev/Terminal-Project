# vowels = ['a', 'i', 'o', 'e', 'u'].shuffle[1]
# vowels2 = ['a', 'i', 'o', 'e', 'u'].shuffle[0..4]  #what does this modifier even do // returns nil at 5, ohhh it must shuffle the array and return
# #whatever that index position is
# vowels3 = ('a'..'z').to_a.shuffle[0..4] 

require "tty-prompt"
require "ruby_figlet"
prompt=TTY::Prompt.new
require "lolcat"

p lolcat "Hello"

puts RubyFiglet::Figlet.new("meow...").to_s
# p vowels
# p vowels2
# p vowels3

# result=prompt.ask("Please pick 2 - 12 letters?") do |q|
#     q.in '2-12'
#     q.messages[:range?]= '%{value} out of expected range'
#      end
    

# p result

    
userinput=prompt.ask("Please enter the longest word you can think of:") do |q|
q.required true
  q.validate /\A\w+\Z/
  q.modify   :downcase
    end

    p userinput
     
