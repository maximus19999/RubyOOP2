require_relative "country"
require_relative"medal_rankings"

medal_calculations = MedalRankings.new("medals.txt")
######print average and most gold won
puts "Average population of all countries = "+medal_calculations.average_pop.to_s
puts "country that won most gold medals = "+medal_calculations.most_golds.to_s
puts "   "#to put in a blank line
######print sorted countries
medal_calculations.sort!
puts "top ten countries ranked by score"
(0..9).each do |i|
  puts medal_calculations.to_s(i)
  #puts medal_calculations.countrys[i].score_value #uncomment to display score
end
#####display single gold winners
puts "    "
puts "countries that won only a single gold"
sin_gold_winner =  medal_calculations.each_single_gold_winner
sin_gold_winner.each {|country|
  puts country.to_s
}