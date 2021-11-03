require_relative "character"

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
    puts "There are #{@players.length} players in #{@title}:"

    @players.each do |char|
      puts char
    end

    @players.each do |item|
      item.take_damage(4)
      item.heal_damage(12)
      item.heal_damage(12)
      puts item
    end
  end

end


if __FILE__ == $PROGRAM_NAME
  black_hole = Game.new('Black Hole')
  black_hole.add_player(Character.new("Tri Moon", 80))
  black_hole.play
end
