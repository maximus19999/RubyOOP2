require 'test/unit'
require_relative "medal_rankings"
class MedalRankingTest < Test::Unit::TestCase


  def setup
    @test_medals = MedalRankings.new("medals.txt")
  end

  def test_to_s
    assert_equal(@test_medals.to_s(0), "AFG, 0, 0, 1, 34385000", error_message="to string not working")#test to string
  end


end