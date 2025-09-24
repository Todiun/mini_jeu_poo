class Player

  attr_accessor :name, :lp 
#Character creator
  def initialize(name)
    @name = name
    @lp = 10
  end
  

#Character status
  def status
    puts "#{@name} has #{@lp} life points"
  end
  
#Inflict Damage(out of combat)
  def gets_damage(damage)
  @lp -= damage
    if @lp <= 0
    @lp = 0
    puts "#{@name} has been slain !"
    end
  end

#Combat Damage
  def attacks(other_player)
    puts "#{@name} attacks #{other_player.name}"
    damage = compute_damage
    other_player.gets_damage(damage)
    puts "Target player lost #{damage} life points"
  end

  #Damage Randomizer
  def compute_damage
    rand(1..6)
  end

end

#V2 =====================================


#Human Class
class HumanPlayer < Player
  attr_accessor :weapon_lvl

  #Character creator
  def initialize(name)
    super(name)
    @lp = 100
    @weapon_lvl = 1
  end

  #Character status
  def status
    puts "#{@name} has #{lp} life points and a level #{weapon_lvl} weapon"
  end

  

  #Weapon Search
  def loot
    sword = rand(1..6)
    puts "You find a level #{sword} sword"
    if sword > @weapon_lvl
      @weapon_lvl = sword
      puts "It is better than the one you have, you throw your old sword away !"
    else
      puts "It is worse than the one you have, you toss it aside and keep moving !"
    end
  end

  #Inflict Damage
  def compute_damage
  rand(1..6) * @weapon_lvl
  end

#Healing
  def medpac
    medpac_roll = rand(1..6)
    case medpac_roll
    when 1
      puts "You didn't find anything..."
    when 2..5
      @lp += 50
      @lp = 100 if @lp > 100
      puts "You found a medpac and used it, Hooray"
    when 6
      @lp += 80
      @lp = 100 if @lp > 100
      puts "You found a massive medpac and used it, Good job !"
    end
  end
end