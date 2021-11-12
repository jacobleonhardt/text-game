require_relative "spec_helper"
require_relative "game"
require_relative "character"
require_relative "die"
require_relative "game_turn"
require_relative "pet_collection"

describe Game do
  before do
    @game = Game.new('Donut Brigade')
    @init_hp = 100
    @player = Character.new("Proper", @init_hp)
    @game.add_player(@player)
  end

  it "nat 20" do
    Die.any_instance.stub(:roll).and_return(20)
    @game.play(3)
    @player.hp.should == @init_hp
  end
  it "high die roll" do
    Die.any_instance.stub(:roll).and_return(19)
    @game.play(3)
    @player.hp.should == @init_hp + 45
  end

  it "medium die roll" do
    Die.any_instance.stub(:roll).and_return(12)
    @game.play(3)
    @player.hp.should == @init_hp
  end

  it "low die roll" do
    Die.any_instance.stub(:roll).and_return(2)
    @game.play(3)
    @player.hp.should == @init_hp - 30
  end
  it "nat 1" do
    Die.any_instance.stub(:roll).and_return(1)
    @player.hp.should == @init_hp
  end

  context "in a collection of players" do
    before do
      @player1 = Character.new('Tri', 100)
      @player2 = Character.new("Gev'or", 125)
      @player3 = Character.new("Xander", 150)

      @players = [@player1, @player2, @player3]
    end

    it "is sorted by decreasing score" do
      @players.sort.should == [@player3, @player2, @player1]
    end
  end

  context "test pet adoption and score" do
    it "assign a pet for points during a player's turn" do
      game = Game.new('Black Hole')
      player = Character.new("Tri")

      game.add_player(player)
      game.play(1)
      player.points.should_not be_zero
    end
  end

  context "test grand total for all players" do
    it "computes total points as the sum of all player points" do
      game = Game.new("The Onus Project")
      player1 = Character.new('Test One')
      player2 = Character.new('Test Two')

      game.add_player(player1)
      game.add_player(player2)

      player1.adopt_pet(Pets.new(:porg, 25))
      player1.adopt_pet(Pets.new(:krayt_dragon, 1000))
      player2.adopt_pet(Pets.new(:rancor, 400))

      game.total_points.should == 1425
    end
  end
end
