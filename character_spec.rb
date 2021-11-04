require_relative 'spec_helper'
require_relative 'character'

describe Character do
  before do
    $stdout = StringIO.new
    @init_hp = 100
    @player = Character.new('proper', @init_hp)
  end
  it 'has a capitalized name' do
    @player.name.should == 'Proper'
  end
  it 'has hp of 100' do
    @player.hp.should == 100
  end
  it 'has a pet counter of 106' do
    @player.pet_collection.should == 106
  end
  it 'should decrease hp by 15' do
    @player.take_damage(15)
    @player.hp.should == @init_hp - 15
  end
  it 'should increase hp by 20' do
    @player.heal_damage(20)
    @player.hp.should == @init_hp + 20
  end
  it 'has a string representation' do
    @player.to_s.should == "Player: Proper \n HP: #{@init_hp} \n Pets: 106"
  end

  context 'character is strong' do
    before do
      @init_hp = 100
      @player = Character.new('proper', @init_hp)
    end

    it 'character is strong' do
      @player.should be_strong
    end
  end

  context 'character is weak' do
    before do
      @init_hp = 50
      @player = Character.new('proper', @init_hp)
    end

    it 'character is not strong' do
      @player.should_not be_strong
    end
  end
end
