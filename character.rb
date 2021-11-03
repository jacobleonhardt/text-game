class Character
  def initialize(name, hp=100)
    @name = name.capitalize
    @hp = hp
  end

  attr_accessor :name
  attr_reader :hp

  def name=(new_name)
    @name = new_name.capitalize
  end

  def to_s
    "Player: #{@name} \n HP: #{@hp} \n Pets: #{pet_collection}"
  end

  def heal_damage(heal)
    @hp += heal
    puts "#{@name} healed #{heal}pts of HP."
  end

  def take_damage(damage)
    @hp -= damage
    puts "#{@name} took #{damage}pts of damage."
  end

  def pet_collection
    @hp + @name.length
  end

end

if __FILE__ == $0
  tri = Character.new("Tri Moon", 80)
  tri.take_damage(50)
  tri.heal_damage(100)
end
