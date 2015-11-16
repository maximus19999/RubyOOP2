require_relative "country"
require_relative"medal_rankings"

t = MedalRankings.new("medals.txt")
puts t.average_pop
puts t.most_golds