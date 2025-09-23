class Player

  attr_accessor :name, :lp 

  def initialize(name)
    @name = name
    @lp = 10
  end

  def status
    puts "#{@name} has #{@lp} life points"
  end
  
  def gets_damage(damage)
  @lp -= damage
    if @lp <= 0
    @lp = 0
    puts "#{@name} has been slain !"
    end
  end
  
  def attacks(other_player)
    puts "#{@name} attacks #{other_player.name}"
    damage = compute_damage
    other_player.gets_damage(damage)
    puts "Target player lost #{damage} life points"
  end

  def compute_damage
    rand(1..6)
  end

end