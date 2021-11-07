require_relative "spec_helper"
require_relative "game"
require_relative "character"
require_relative "die"
require_relative "game_turn"

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
end
