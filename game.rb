require_relative "character"
require_relative "die"

class Game
  def initialize(title)
    @title = title
    @players = []
  end

  attr_reader :title

  def add_player(player)
    @players.push(player)
  end

  def play
    # puts "There are #{@players.length} players in #{@title}:"

    # @players.each do |char|
    #   puts char
    # end

    @players.each do |item|
        die = Die.new
        case die.roll
        when 15..19
          item.heal_damage(15)
        when 20
          puts "Nat 20!"
        when 2..8
          item.take_damage(10)
        when 1
          puts "Oh no! Nat 1!"
        else
          puts "Skipped."
        end
      puts item
    end
  end

end


if __FILE__ == $PROGRAM_NAME
  black_hole = Game.new('Black Hole')
  black_hole.add_player(Character.new("Tri Moon", 80))
  black_hole.play
end
