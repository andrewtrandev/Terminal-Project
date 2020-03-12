# Terminal Scrabble

# Software Development Plan

## R3.Referenced Sources
Gems
https://www.rubydoc.info/gems/tty-prompt
https://github.com/piotrmurach/tty-box
https://rdoc.info/github/fazibear/colorize
https://github.com/nitishparkar/dictionary-lookup-rb
https://github.com/Demonstrandum/RubyFiglet
https://exercism.io/tracks/ruby/exercises/scrabble-score/solutions/70afb9275c054c2dab17d7a21da7d408



## R4.Source Control Repository
https://github.com/andrewtrandev/terminalproject

## R5.Purpose and Scope
Program will entertain users by allows them to play
the word game Scrabble in terminal. I'm developing this to test out some programming ideas and features, I also like Scrabble and thought it would be a fun idea to try out.

## Target Audience
The target audience is bored people looking for entertainment and people interested in word games or looking to play Scrabble in terminal.

## How to use
The target audience will be prompted to enter how many letters they would like to play with.
They will be then given a random set of letters. They will then be prompted to enter a word that uses those random letters. 
If the word doesn't match, the program will end.
If the word uses the letters given, check if it exists in the dictionary, user is given points based on word length.
User is then told their final score and asked whether they want to play again. 

## R6.Features
Replay game - a while loop that allows you to continue to play again by entering y. Alternatively pressing any other key will stop the current instance of the game.

Accruing point system - points earned will carry over to future games in the instance. Adds the score onto a variable outside the while loop so that the score doesn't get reset.

Vowel adder - if number of letters is greater than 6, add more vowels to make the game easier. Done through a method that first checks
if the word is less than 6 letters and if so will shuffle at least one vowel in, if the word is greater than 6 letters it'll shuffle at least 2 vowels in.

## R7.User Interaction and Experience
User will be prompted to enter how many letters they want to play with,
if user tries to enter number out of the range, display "value is out of expected range 2-20 letters" 
User will be prompted to enter a word using the randomized letters.
If user's input doesn't exist in randomized letters then display 'Not a valid word' , award 0 points and end game.  
If letters used match randomized letters, check if word exists in dictionary.
Award and store points based on length.
Then ask if user wants to play again, user selects 'y' to play again or 'n'
to end the game loop. If user decides to play again, score should carry over and continue to add whilst in the same instance of game loop.

## R9.Implementation Plan
Replay Game
Accruing Point System 
Vowel Adder

## R10. Help Documentation

## R17. Manual Testing
Test 1.
Feature being tested
User should not be able to get points for using letters
that are not output by the program

Test Case Summary
I'll use letters other than the ones output by program

Test Data
Program output
User Input

Expected Result
User should not get points for using letters not output by program

Actual Result
User did not get points for using letters not output by program

Status
Passed

Comment
Works as expected

Test 2.
Feature being tested
Vowel Adder

Test Case Summary
Add vowels based on word length, 1 vowel if 5 letters and 2 vowels if 6 letters or more

Test Data
Userinput =5

Expect Result


Actual Result


Status


Comment



