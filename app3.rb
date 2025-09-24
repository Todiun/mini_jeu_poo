require 'bundler'
Bundler.require
require_relative 'lib/player'
require_relative 'lib/game'

puts "------------------------------------------------"
puts "|       Welcome to SWORD SURVIVOR !!!!        |"
puts "|   Be the last one standing !!!              |"
puts "------------------------------------------------"

#Character creator
print "\nWhat's your name? => "
player_name = gets.chomp
my_game = Game.new(player_name)

# Game Loop
while my_game.is_still_ongoing?
  my_game.new_players_in_sight
  my_game.show_players
  my_game.menu
  print "=> "
  choice = gets.chomp
  my_game.menu_choice(choice)
  my_game.enemies_attack
end

# ending
my_game.end