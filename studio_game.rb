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


proper = Character.new('proper', 100)
maser = Character.new('MASER', 80)
takka = Character.new('taKka')
delta = Character.new('deltA', 80)
astra = Character.new('astra', 120)
jim = Character.new('Zabrak Jim')

puts proper
puts takka.name
puts maser.hp
puts delta.hp
astra.name = 'stratta'
puts astra.name
