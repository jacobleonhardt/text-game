require_relative "character"
require_relative "die"
require_relative "game_turn"

class Game
  def initialize(title)
    @title = title
    @players = []
  end

  attr_reader :title

  def add_player(player)
    @players.push(player)
  end

  def play(rounds)
    puts "There are #{@players.length} players in #{@title}:"

    @players.each do |char|
      puts char
    end

    1.upto(rounds) do |i|
      puts "Round #{i}"
      @players.each do |character|
        GameTurn.take_turn(character)
        puts character
      end
    end
  end

  def print_stats
    healthy, wounded = @players.partition{|player| player.strong? }

    puts "#{healthy.length} healthy players:"
    healthy.each do |char|
      puts "#{char.name} (#{char.hp})"
    end

    puts "#{wounded.length} wounded players:"
    wounded.each do |char|
      puts "#{char.name} (#{char.hp})"
    end
  end

end


if __FILE__ == $PROGRAM_NAME
  black_hole = Game.new('Black Hole')
  black_hole.add_player(Character.new("Tri Moon", 80))
  black_hole.play(40)
end
