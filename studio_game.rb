require_relative "game"
require_relative "character"
require_relative "legendary_character"
require_relative "darkside_character"

puts "\nA long time ago,\nIn a galaxy far, far away..."
puts "\nStar Wars: Animal Wrangler"

puts "\n \nWhat's your party called?"
playing_party = gets.chomp

party = Game.new(playing_party)
party.load_players(ARGV.shift || "donut_brigade.csv")
party.add_player(DarksideCharacter.new("Zabrak Jim", 80))
party.add_player(LegendaryCharacter.new("Master Mook", 120))

loop do
  puts "\nHow many rounds to you want to play? (type \"end\" to escape.)"
  rounds = gets.chomp.downcase

  case rounds
  when /^\d+$/
    party.play(rounds.to_i) {party.total_points >= 5000}
  when "end", "quit", "escape", "exit"
    party.game_end
    break
  else
    puts "Do or do not..."
  end

end

party.save_high_scores
