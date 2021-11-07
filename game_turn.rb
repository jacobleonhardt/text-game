require_relative 'character'
require_relative 'die'

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
  end


end
