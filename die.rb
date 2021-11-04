class Die

  def initialize
    roll
  end

  attr_reader :result

  def roll
    @result = rand(1..20)
  end

end
