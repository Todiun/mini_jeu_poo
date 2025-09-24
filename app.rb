require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


#Characters created
player1 = Player.new("Josiane")
player2 = Player.new("José")

#Fighting
while player1.lp > 0 && player2.lp > 0
  puts "\nVoici l'état de nos joueurs :"
  puts player1.status
  puts player2.status

  puts "Attack phase begins :"
  player1.attacks(player2)
  if player2.lp <= 0
      break
  end
    player2.attacks(player1)
end

binding.pry