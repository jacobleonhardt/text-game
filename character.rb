require_relative "pet_collection"
require_relative "playable"

class Character
  include Playable

  def initialize(name, hp=100, handle=0)
    @name = name.capitalize
    @hp = hp
    @adopted_pets = Hash.new(0)
    @handle = handle
  end

  attr_accessor :hp
  attr_reader :name

  def name=(new_name)
    @name = new_name.capitalize
  end

  def to_s
    "#{@name}:\n HP = #{@hp}\n Pets = #{points}\n Score = #{pet_collection} \n"
  end

  def <=>(other)
    other.pet_collection <=> pet_collection
  end

  def self.from_csv(line)
    name, hp = line.split(',')
    Character.new(name, Integer(hp))
  end

  def pet_collection
    @hp + points
  end

  def adopt_pet(pet)
    @adopted_pets[pet.name] += pet.points
    puts "#{@name} adopted a #{pet.name} worth #{pet.points}."
    puts "#{@name}'s pets include: #{@adopted_pets}"
  end

  def each_pet_adopted
    @adopted_pets.each do |name, points|
      yield Pets.new(name, points)
    end
  end

  def points
    @adopted_pets.values.reduce(0, :+)
  end

end

if __FILE__ == $0
  tri = Character.new("Tri Moon", 80)
  tri.take_damage(50)
  tri.heal_damage(100)
end
