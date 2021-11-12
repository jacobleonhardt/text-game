module Playable
  def strong?
    hp > 50
  end

  def heal_damage(heal)
    self.hp += heal
    puts "#{name} healed #{heal}pts of HP."
  end

  def take_damage(damage)
    self.hp -= damage
    puts "#{name} took #{damage}pts of damage."
  end

end
