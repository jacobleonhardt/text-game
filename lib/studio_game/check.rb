require_relative "game_turn"
require_relative "character"
require_relative "die"

module StudioGame
  module CheckRoll

    def self.check_roll(character, pet, roll)
      check = false

      case roll
      when 1
        puts "Oh no! Nat 1!"
        character.take_damage(15)
        check

      when 2..5
        character.take_damage(10)
        if "#{pet.name}" == "krayt_dragon" ||
          "#{pet.name}" == "rancor" ||
          "#{pet.name}" == "nexu" ||
          "#{pet.name}" == "aryx" ||
          "#{pet.name}" == "tauntaun" ||
          "#{pet.name}" == "porg"
          check
        else
          check = true
        end

      when 6..8
        character.take_damage(5)
        if "#{pet.name}" == "krayt_dragon" ||
          "#{pet.name}" == "rancor" ||
          "#{pet.name}" == "nexu" ||
          "#{pet.name}" == "aryx" ||
          "#{pet.name}" == "tauntaun"
          check
        else
          check = true
        end

      when 9..11
        character.heal_damage(5)
        if "#{pet.name}" == "krayt_dragon" ||
          "#{pet.name}" == "rancor" ||
          "#{pet.name}" == "nexu" ||
          "#{pet.name}" == "aryx"
          check
        else
          check = true
        end

      when 12..14
        character.heal_damage(5)
        if "#{pet.name}" == "krayt_dragon" ||
          "#{pet.name}" == "rancor" ||
          "#{pet.name}" == "nexu"
          check
        else
          check = true
        end

      when 15..17
        character.heal_damage(5)
        if "#{pet.name}" == "krayt_dragon" ||
          "#{pet.name}" == "rancor"
          check
        else
          check = true
        end

      when 18..19
        character.heal_damage(5)
        if "#{pet.name}" == "krayt_dragon"
          check
        else
          check = true
        end

      when 20
        puts "Nat 20!"
        character.heal_damage(15)
        check = true

      when 21..40
        character.heal_damage(10)
        check = true

      else
          check
      end
    end

  end
end
