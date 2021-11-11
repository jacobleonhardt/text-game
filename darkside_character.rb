require_relative "character"

class DarksideCharacter < Character

  def adopt_pet(pet)
    darkside_pet = Pets.new(pet.name, (pet.points / 2).to_i)
    super(darkside_pet)
  end
end

if __FILE__ == $0
  darkside = DarksideCharacter.new("Zabrak Jim")

  aryx = Pets.new(:aryx, 100)
  darkside.adopt_pet(aryx)
  darkside.adopt_pet(aryx)
  darkside.adopt_pet(aryx)

  nexu = Pets.new(:nexu, 200)
  darkside.adopt_pet(nexu)

  darkside.each_pet_adopted do |pet|
    puts "#{pet.points} total #{pet.name} points"
  end
  puts "#{darkside.points} grand total points"

end
