# Terminal Scrabble

# Software Development Plan

## R5.Purpose and Scope
Program will entertain users by allows them to play
the word game scrabble in terminal.

## Target Audience
The target audience is bored people looking for entertainment.

## How to use
The target audience will be prompted to enter how many letters they would like to play with.
They will be then given a random set of letters. They will then be prompted to enter a word
that uses those random letters. If the word doesn't match, the program will end.
If the word exists in the dictionary then the user will be awarded points.
Finally the user will be asked if they want to play again. 

## R6.Features
Replay game - while loop that allows you to continue to play again by entering y or n

Accruing point system - points earned will carry over to future games in the instance. 

Vowel adder - if number of letters is greater than 6, add more vowels to make the game easier. Done through a method that first checks
if the word is less than 6 letters and if so will shuffle at least one vowel in, if the word is greater than 6 letters it'll shuffle at least 2 vowels in.

## R7.Outline
User will be prompted to enter how many letters they want to play with
User will be prompted to enter a word using the randomized letters
If user input doesn't exist in randomized letters then return false
If letters used match randomized letters, check if word exists in dictionary
Award and store points based on length
Ask if user wants to play again, user enters y to play again or anything else to quit


## R3.Referenced Sources
Gems
https://www.rubydoc.info/gems/tty-prompt
https://rdoc.info/github/fazibear/colorize
https://github.com/nitishparkar/dictionary-lookup-rb
https://www.rubydoc.info/gems/lolcat/100.0.0
https://github.com/Demonstrandum/RubyFiglet


## R4.Source Control Repository
https://github.com/andrewtrandev/terminalproject