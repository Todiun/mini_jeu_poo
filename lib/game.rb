def gets_damage(damage)
  @lp -= damage
  if @lp <= 0
  @lp = 0
  puts "#{@name} has been slain !"
  end
end