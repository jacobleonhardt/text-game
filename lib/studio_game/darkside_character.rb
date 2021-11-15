require_relative "character"

module StudioGame
  class DarksideCharacter < Character

    def initialize(name, hp=80, ds_points=1)
      super(name, hp)
      @ds_points = ds_points
    end

    def sith?
      @ds_points > 5
    end

    def heal_damage(points)
      ds_heal = points * @ds_points
      super(ds_heal)
      @ds_points += 1 unless sith?
    end

    def adopt_pet(pet)
      darkside_pet = Pets.new(pet.name, (pet.points / 2).to_i)
      super(darkside_pet)
    end
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

  1.upto(7) do
    darkside.heal_damage(5)
  end

  darkside.each_pet_adopted do |pet|
    puts "#{pet.points} total #{pet.name} points"
  end
  puts "#{darkside.points} grand total points"

end
