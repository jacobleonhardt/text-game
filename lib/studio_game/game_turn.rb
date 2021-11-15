require_relative 'character'
require_relative 'die'
require_relative 'loaded_die'
require_relative 'pet_collection'
require_relative 'check'

module StudioGame
  module GameTurn

    def self.change_die
      odds = [1, 2, 3, 4, 5, 6]
      odds.sample
    end

    def self.take_turn(character)
      pet = PetCollection.random
      puts "A #{pet.name} has appeared!"

      if change_die == 6
        puts "You found a Loaded Die!\nDo you want to use it? Y/N"
        selected = gets.chomp.downcase
        if selected == 'y'
          die = LoadedDie.new
        else
          die = Die.new
        end
      else
        die = Die.new
      end

      check = die.roll

      if CheckRoll::check_roll(character, pet, check) == true
        character.adopt_pet(pet)
      else
        puts "#{pet.name} got away."
      end
    end
  end
end
