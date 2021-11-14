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
    pet = PetCollection.random
    puts "A #{pet.name} has appeared!"

    if change_die == 6
      puts "You found a Loaded Die!\nDo you want to use it? Y/N"
      selected = gets.chomp.downcase
      if selected == 'n'
        die = LoadedDie.new
      else
        die = Die.new
      end
    else
      die = Die.new
    end

    check = die.roll


    case check
    when 1
      puts "Oh no! Nat 1!"
      puts "#{pet.name} got away..."
      character.take_damage(15)
    when 2..5
      character.take_damage(10)
      if "#{pet.name}" == "krayt_dragon" ||
        "#{pet.name}" == "rancor" ||
        "#{pet.name}" == "nexu" ||
        "#{pet.name}" == "aryx" ||
        "#{pet.name}" == "tauntaun" ||
        "#{pet.name}" == "porg"
        puts "#{pet.name} got away."
      else
        character.adopt_pet(pet)
      end
    when 6..8
      character.take_damage(5)
      if "#{pet.name}" == "krayt_dragon" || "#{pet.name}" == "rancor" || "#{pet.name}" == "nexu" || "#{pet.name}" == "aryx" || "#{pet.name}" == "tauntaun"
        puts "#{pet.name} got away."
      else
        character.adopt_pet(pet)
      end
    when 9..11
      character.heal_damage(5)
      if "#{pet.name}" == "krayt_dragon" || "#{pet.name}" == "rancor" || "#{pet.name}" == "nexu" || "#{pet.name}" == "aryx"
        puts "#{pet.name} got away."
      else
        character.adopt_pet(pet)
      end
    when 12..14
      character.heal_damage(5)
      if "#{pet.name}" == "krayt_dragon" || "#{pet.name}" == "rancor" || "#{pet.name}" == "nexu"
        puts "#{pet.name} got away."
      else
        character.adopt_pet(pet)
      end
    when 15..17
      character.heal_damage(5)
      if "#{pet.name}" == "krayt_dragon" || "#{pet.name}" == "rancor"
        puts "#{pet.name} got away."
      else
        character.adopt_pet(pet)
      end
    when 18..19
      character.heal_damage(5)
      if "#{pet.name}" == "krayt_dragon"
        puts "#{pet.name} got away."
      else
        character.adopt_pet(pet)
      end
    when 20
      puts "Nat 20!"
      character.heal_damage(15)
      character.adopt_pet(pet)
    when 21..40
      character.heal_damage(10)
    else
        puts "#{pet.name} got away..."
      end
  end

end
