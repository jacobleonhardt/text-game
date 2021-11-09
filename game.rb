require_relative "character"
require_relative "die"
require_relative "game_turn"
require_relative "pet_collection"

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

    pets = PetCollection::PETS
    puts "There are #{pets.length} different pets to collect."
    pets.each do |pet|
      puts "A #{pet.name} is worth #{pet.points} points."
    end

    1.upto(rounds) do |i|
      puts "Round #{i}"
      @players.each do |character|
        GameTurn.take_turn(character)
        puts character
      end
    end
  end

  def print_name_and_health(char)
    puts "#{char.name} (#{char.hp})"
  end

  def print_stats
    healthy, wounded = @players.partition{|player| player.strong? }

    puts "#{healthy.length} healthy players:"
    healthy.each do |char|
      print_name_and_health(char)
    end

    puts "#{wounded.length} wounded players:"
    wounded.each do |char|
      print_name_and_health(char)
    end

    @players.each {|char| puts "#{char.name}'s total score: \n#{char.pet_collection} grand total points"}
  end

  def high_scores
    puts "#{@title} High Scores:"
    @players.sort.each do |char|
      puts "#{char.name.ljust(20, '.')}#{char.pet_collection}"
    end
  end

  def game_end
    print_stats
    high_scores
  end
end


if __FILE__ == $PROGRAM_NAME
  black_hole = Game.new('Black Hole')
  black_hole.add_player(Character.new("Tri Moon", 80))
  black_hole.play(40)
end
