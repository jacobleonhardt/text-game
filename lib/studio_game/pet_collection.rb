module StudioGame
  Pets = Struct.new(:name, :points)

  module PetCollection
    PETS = [
      Pets.new(:womp_rat, 5),
      Pets.new(:porg, 25),
      Pets.new(:tauntaun, 50),
      Pets.new(:aryx, 100),
      Pets.new(:nexu, 200),
      Pets.new(:rancor, 400),
      Pets.new(:krayt_dragon, 1000)
    ]

    def self.random
      PETS.sample
    end
  end
end
