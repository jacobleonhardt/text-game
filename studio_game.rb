require_relative "game"
require_relative "character"

puts "\nWelcome!"
puts "Who's playing?"
playing_party = gets.chomp

party = Game.new(playing_party)
party.load_players(ARGV.shift || "donut_brigade.csv")

loop do
  puts "\nHow many rounds to you want to play? (type \"end\" to escape.)"
  rounds = gets.chomp.downcase

  case rounds
  when /^\d+$/
    party.play(rounds.to_i) {party.total_points >= 2000}
  when "end", "quit", "escape", "exit"
    party.game_end
    break
  else
    puts "Do or do not..."
  end

end

party.save_high_scores
