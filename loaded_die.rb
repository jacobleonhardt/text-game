require_relative "auditable"

class LoadedDie
  include Auditable

  attr_reader :result, :roll

  def roll
    numbers = [3, 8, 12, 15, 16, 16, 19, 20, 20, 20]
    @rolled = numbers.sample
    audit
    @result = @rolled
  end

end
