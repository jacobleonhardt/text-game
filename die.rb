require_relative "auditable"

class Die
  include Auditable

  # def initialize
  #   roll
  # end

  attr_reader :result, :rolled

  # def roll(character)
  #   @rolled = rand(1..20)
  #   audit
  #   @rolled
  # end

  def roll
    puts "Roll a Handle Animal check..."
    result = gets.chomp.downcase
    case result
    when /^\d+$/
      puts "Rolled a #{result}."
      return result.to_i
    when "skip"
      return 0
    else
      puts "Return your check result, or type 'skip' move on."
    end
  end

end
