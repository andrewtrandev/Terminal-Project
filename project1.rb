#text adventure game
#start as a warrior 
#must defeat a boss at the end
#can grab armor or buy armor
#can pick up food to recover health
#pick up sword -> display sword ascii

#maybe just a forward path

def getname(prompt)
    p prompt
    return gets.chomp
end

name=getname("Please enter your name:")

# class Warrior
#     attr_accessor :name, :attack, :health
#     def initialize(name)
#     @name=name
#     @attack=5
#     @health=7
#     end
# end

p "You are #{name} a servant of your kingdom, you've been betrayed and thrown into the dungeon"
p "Live, escape, and get revenge." 



