require_relative "country"
require_relative"medal_rankings"

medal_calculations = MedalRankings.new("medals.txt")
puts "Average population of all countries = "+medal_calculations.average_pop.to_s
puts "country that won most gold medals = "+medal_calculations.most_golds.to_s