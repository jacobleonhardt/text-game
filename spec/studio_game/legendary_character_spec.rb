require "studio_game/legendary_character"

module StudioGame
  describe LegendaryCharacter do
    before do
      @initial_hp = 100
      @player = LegendaryCharacter.new("Trent", @initial_hp)
    end

    it "does not become Legendary until healed up to 5 times" do
      1.upto(5) { @player.heal_damage(5) }
      @player.legendary?.should be_falsey
    end

    it "becomes legendary after healing more than 5 times" do
      1.upto(6) { @player.heal_damage(5) }
      @player.legendary?.should be_truthy
    end

    it "legendary character gets healed instead of taking damage" do
      1.upto(6) { @player.heal_damage(5) }
      1.upto(2) { @player.take_damage(5) }

      @player.hp.should == @initial_hp + (8 * 5)
    end

  end
end
