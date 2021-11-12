require_relative 'character'
require_relative 'die'
require_relative 'loaded_die'
require_relative 'pet_collection'

module GameTurn

  def self.change_die
    odds = [1, 2, 3, 4, 5, 6]
    odds.sample
  end

  def self.take_turn(character)
      puts "#{character.name}'s turn:"
      if change_die = 6
        die = LoadedDie.new
      else
        die = Die.new
      end

      case die.roll
      when 15..19
        character.heal_damage(15)
      when 20
        puts "Nat 20!"
      when 2..8
        character.take_damage(10)
      when 1
        puts "Oh no! Nat 1!"
      else
        puts "Skipped."
      end

      pet = PetCollection.random
      character.adopt_pet(pet)
  end


end
