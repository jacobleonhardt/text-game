require_relative "auditable"

class Die
  include Auditable

  # def initialize
  #   roll
  # end

  attr_reader :result

  def roll
    @result = rand(1..20)
    audit
    @result
  end

  # def roll
  #   puts "Roll a Handle Animal check..."
  #   result = gets.chomp.downcase
  #   case result
  #   when /^\d+$/
  #     return result.to_i
  #   when "skip"
  #     return result
  #   else
  #     puts "Return your check result, or type 'skip' move on."
  #   end
  # end

end
