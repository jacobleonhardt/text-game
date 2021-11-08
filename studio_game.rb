require_relative "game"
require_relative "character"

proper = Character.new('proper', 100)
maser = Character.new('MASER', 80)
takka = Character.new('taKka')
delta = Character.new('deltA', 80)
astra = Character.new('astra', 120)
jim = Character.new('Zabrak Jim')

party = Game.new('Donut Brigade')
party.add_player(proper)
party.add_player(maser)
party.add_player(takka)
party.add_player(delta)
party.add_player(astra)

party.play(5)
party.print_stats
party.high_scores
