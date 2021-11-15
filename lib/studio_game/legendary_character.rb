require_relative "character"

module StudioGame
  class LegendaryCharacter < Character
    def initialize(name, hp=100, track=0)
      super(name, hp)
      @track = track
    end

    def legendary?
      @track > 5
    end

    def take_damage(damage)
      legendary? ? heal_damage(damage) : super(damage)
    end

    def heal_damage(heal)
      super
      @track += 1
      puts "#{@name} is legendary!" if legendary?
    end

  end
end

if __FILE__ == $0
  legendary = LegendaryCharacter.new('Trent', 100)
  6.times { legendary.heal_damage(10) }
  2.times { legendary.take_damage(15) }
  puts legendary.hp
end
