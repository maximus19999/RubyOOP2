require 'test/unit'
require_relative "medal_rankings"
class MedalRankingTest < Test::Unit::TestCase

  def setup
    @test_medals = MedalRankings.new("medals.txt")
  end
  def test_to_s
    assert_equal(@test_medals.to_s(0), "AFG, 0, 0, 1, 34385000", error_message="to string not working")#test to string
  end
  def test_most_gold
    assert_equal(@test_medals.most_golds.to_s, "USA, 46, 29, 29, 309349000", error_message="incorrect gold medal tally")#test most golds won
  end
  def test_ave_pop
    assert_equal(@test_medals.average_pop, 33778365, error_message="average population not calculating")#test average population
  end
end