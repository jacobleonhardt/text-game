require_relative "pet_collection"

describe Pets do
  before do
    @pets = Pets.new(:tauntaun, 50)
  end

  it "has a name attribute" do
    @pets.name.should == :tauntaun
  end

  it "has a points attribute" do
    @pets.points.should == 50
  end

end

describe PetCollection do

  it "has six pets" do
    PetCollection::PETS.size.should == 7
  end

  it "has a Womp Rat worth 5 points" do
    PetCollection::PETS[0].should == Pets.new(:womp_rat, 5)
  end

  it "has a Porg worth 25 points" do
    PetCollection::PETS[1].should == Pets.new(:porg, 25)
  end

  it "has a Tauntaun worth 50 points" do
    PetCollection::PETS[2].should == Pets.new(:tauntaun, 50)
  end

  it "has a Aryx worth 100 points" do
    PetCollection::PETS[3].should == Pets.new(:aryx, 100)
  end

  it "has a Nexu worth 200 points" do
    PetCollection::PETS[4].should == Pets.new(:nexu, 200)
  end

  it "has a Rancor worth 400 points" do
    PetCollection::PETS[5].should == Pets.new(:rancor, 400)
  end

  it "has a Krayt Dragon worth 1000 points" do
    PetCollection::PETS[6].should == Pets.new(:krayt_dragon, 1000)
  end

  it "returns a random pet" do
    pet = PetCollection.random

    PetCollection::PETS.should include(pet)
  end

end
