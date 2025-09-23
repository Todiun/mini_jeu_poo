class Player

  attr_accessor :name, :lp 

  def initialize(name)
    @name = name
    @lp = 10
  end

  def status
    puts "#{@name} has #{@lp} life points"
  end
end