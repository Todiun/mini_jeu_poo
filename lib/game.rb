class Game
  attr_accessor :human_player, :enemies_in_sight, :players_left

  # Game start
  def initialize(human_name)
    @human_player = HumanPlayer.new(human_name)
    @players_left = 10
    @enemies_in_sight = []
  end

  # Check game state
  def is_still_ongoing?
    @human_player.lp > 0 && (@players_left > 0 || !@enemies_in_sight.empty?)
  end

  # Character status
  def show_players
    puts "\n#{@human_player.status}"
    puts "Enemies left: #{@players_left}, currently in sight: #{@enemies_in_sight.size}"
  end

  # Menu
  def menu
    puts "\nWhat do you want to do?"
    puts "a - Search for a better weapon"
    puts "s - Search for a health pack"
    puts "Attack an enemy:"
    @enemies_in_sight.each_with_index do |enemy, index|
      puts "#{index} - #{enemy.status}" if enemy.lp > 0
    end
  end

  # Player choices
  def menu_choice(choice)
    case choice
    when "a"
      @human_player.search_weapon
    when "s"
      @human_player.search_health_pack
    else
      index = choice.to_i
      if @enemies_in_sight[index] && @enemies_in_sight[index].lp > 0
        @human_player.attacks(@enemies_in_sight[index])
        kill_player(@enemies_in_sight[index]) if @enemies_in_sight[index].lp <= 0
      else
        puts "Invalid choice or enemy already dead!"
      end
    end
  end

  # Delete player method
  def kill_player(player)
    @enemies_in_sight.delete(player)
    @players_left -= 1
    puts "#{player.name} has been killed!"
  end

  # Enemy attacks if
  def enemies_attack
    if @enemies_in_sight.any?
      puts "\nEnemies attack you!"
      @enemies_in_sight.each do |enemy|
        enemy.attacks(@human_player) if enemy.lp > 0
      end
    end
  end

  # More enemies
  def new_players_in_sight
    return if @enemies_in_sight.size >= @players_left
    dice = rand(1..6)
    new_enemies = case dice
      when 1
        0
        when 2..4
        1
        when 5..6
        2
        end
    new_enemies.times do
      new_enemy = Player.new("Enemy number > #{rand(1000..9999)}")
      @enemies_in_sight << new_enemy
      puts "A new enemy appears: #{new_enemy.name}!"
    end
    puts "No new enemy this turn!" if new_enemies == 0
  end

  # game ending
  def end
    puts "\nGame over!"
    if @human_player.lp > 0
      puts "BRAVO ! You survived !"
    else
      puts "Loser! You died..."
    end
  end
end