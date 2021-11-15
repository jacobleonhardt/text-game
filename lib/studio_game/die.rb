require_relative "auditable"

module StudioGame
  class Die
    include Auditable

    attr_reader :result, :rolled

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
end
