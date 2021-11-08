require_relative 'character'
require_relative 'die'
require_relative 'pet_collection'

module GameTurn

  def self.take_turn(character)
      die = Die.new
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
      puts "#{character.name} found a #{pet.name} worth #{pet.points} points."
  end


end
