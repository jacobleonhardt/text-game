require_relative "character"
require_relative "die"
require_relative "game_turn"
require_relative "pet_collection"

module StudioGame
  class Game
    def initialize(title)
      @title = title
      @players = []
    end

    attr_reader :title

    def load_players(file_name)
      puts "Players:"
      File.readlines(file_name).each do |line|
        puts line
        add_player(Character.from_csv(line))
      end
    end

    def add_player(player)
      @players.push(player)
    end

    def play(rounds)
      puts "There are #{@players.length} players in #{@title}:"

      @players.each do |char|
        puts char
      end

      pets = PetCollection::PETS
      puts "\nThere are #{pets.length} different pets to collect:"
      pets.each do |pet|
        puts ">> a #{pet.name} is worth #{pet.points} points"
      end

      1.upto(rounds) do |i|
        if block_given?
          break if yield
        end
        puts "\nRound #{i} \n----------"
        @players.each do |character|
          puts "#{character.name}'s turn..."
          GameTurn.take_turn(character)
          puts character
          puts "----------"
        end
      end
    end

    def print_name_and_health(char)
      "#{char.name} (#{char.hp})"
    end

    def print_pet_points(pet)
      "-- #{pet.points} total #{pet.name} points"
    end

    def total_points
      @players.reduce(0) {|sum, player| sum + player.points}
    end

    def print_stats
      healthy, wounded = @players.partition{|player| player.strong? }

      puts "#{healthy.length} healthy players:"
      healthy.each do |char|
        puts print_name_and_health(char)
      end

      puts "#{wounded.length} wounded players:"
      wounded.each do |char|
        puts print_name_and_health(char)
      end

      @players.each do |char|
        puts "\n++ #{char.name}'s Total Score: "
        char.each_pet_adopted do |pet|
          puts print_pet_points(pet)
        end
        puts "== Grand Total: #{char.pet_collection}"
      end

      puts "\n=== #{@title}'s Total Points: #{total_points} ==="
    end

    def high_score_entry(char)
      "#{char.name.ljust(20, '.')}#{char.pet_collection}"
    end

    def high_scores
      puts "\n=== #{@title}'s High Scores ==="
      @players.sort.each do |char|
        puts high_score_entry(char)
      end
    end

    def save_high_scores(file_name="high_scores.txt")
      File.open(file_name, "w") do |file|
        file.puts "=== #{@title}'s High Scores ==="
        @players.sort.each do |char|
          file.puts high_score_entry(char)
        end

        file.puts "\nPlayer Breakdown:"

        healthy, wounded = @players.partition{|player| player.strong? }

        file.puts "\n#{healthy.length} healthy players:"
        healthy.each do |char|
          file.puts print_name_and_health(char)
        end

        file.puts "\n#{wounded.length} wounded players:"
        wounded.each do |char|
          file.puts print_name_and_health(char)
        end

        @players.each do |char|
          file.puts "\n++ #{char.name}'s Total Score: "
          char.each_pet_adopted do |pet|
            file.puts print_pet_points(pet)
          end
          file.puts "== Grand Total: #{char.pet_collection}"
        end

        file.puts "\n=== #{@title}'s Total Points: #{total_points} ==="
      end
    end

    def game_end
      print_stats
      high_scores
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  black_hole = Game.new('Black Hole')
  black_hole.add_player(Character.new("Tri Moon", 80))
  black_hole.play(40)
end
