require_relative "auditable"

module StudioGame
  class LoadedDie
    include Auditable

    attr_reader :result, :roll

    def roll
      numbers = [3, 8, 12, 15, 16, 16, 19, 20, 20, 20]
      @result = numbers.sample
      audit
      @result
    end
  end
end
