require "studio_game/darkside_character"

module StudioGame
  describe DarksideCharacter do
    before do
      @player = DarksideCharacter.new("Zabrak Jim")
    end

    it "only gets half the point value for each pet" do
      @player.points.should == 0

      aryx = Pets.new(:aryx, 100)
      @player.adopt_pet(aryx)
      @player.adopt_pet(aryx)
      @player.adopt_pet(aryx)

      @player.points.should == 150

      nexu = Pets.new(:nexu, 200)
      @player.adopt_pet(nexu)

      @player.points.should == 250

      yielded = []
      @player.each_pet_adopted do |pet|
        yielded << pet
      end

      yielded.should == [Pets.new(:aryx, 150), Pets.new(:nexu, 100)]
    end
  end
end
