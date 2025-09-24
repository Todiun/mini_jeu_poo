require 'bundler'
Bundler.require

require_relative 'lib/player'


puts "------------------------------------------------"
puts "|         Welcome, to SWORD SURVIVOR !!!!         |"
puts "|    You have to be the last one standing !!!!    |"
puts "------------------------------------------------"

#Character Creation
puts "\n What is your name, challenger?"
print "=>"
user = HumanPlayer.new(gets.chomp)
player1 = Player.new("Josiane")
player2 = Player.new("José")

enemies = [player1, player2]

#Combat 

while user.lp > 0 && (player1.lp > 0 || player2.lp > 0)
  puts "\n#{user.status}"
  puts "\nWill you "
  puts "s - Look for a sword ?"
  puts "h - Try to heal ?"
  puts "Attack enemy :"
  puts "1 - #{player1.status}  Attack #{player1.name}?"
  puts "2 - #{player2.status} Attack #{player2.name}?"

  print "=>"
  choice = gets.chomp
  
  
case choice
  when "s"
    user.loot
  when "h"
    user.medpac
  when "1"
    user.attacks(player1) if player1.lp > 0
  when "2"
    user.attacks(player2) if player2.lp > 0
  else
    puts "Unknown entry, please try again"
  end

    if enemies.any? { |enemy| enemy.lp > 0 }
    puts "\nYou are attacked !"
    enemies.each do |enemy|
      enemy.attacks(user) if enemy.lp > 0
    end
  end
end


