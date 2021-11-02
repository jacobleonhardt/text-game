class Character
  def initialize(name, hp=100)
    @name = name.capitalize
    @hp = hp
  end

  def to_s
    "Player: #{@name}, HP: #{@hp}"
  end

  def heal_damage(heal)
    @hp += heal
    puts "#{@name} healed #{heal}pts of HP."
  end

  def take_damage(damage)
    @hp -= damage
    puts "#{@name} took #{damage}pts of damage."
  end
end


proper = Character.new('proper', 100)
mazer = Character.new('MAZER', 80)
takka = Character.new('taKka')
delta = Character.new('deltA', 80)
astra = Character.new('astra', 120)
jim = Character.new('Zabrak Jim')

puts jim
puts proper
puts delta
