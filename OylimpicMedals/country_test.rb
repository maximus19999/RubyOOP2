require 'test/unit'
require_relative "country"
class CountryTest < Test::Unit::TestCase


  def setup
    @count = Country.new("ARG", 1,1,1, 40000000)#get new country
  end
  def test_to_s
    assert_equal(@count.to_s, "ARG, 1, 1, 1, 40000000", error_message="to string not working")#test to string
  end
  def test_get_medal
    assert_equal(@count.num_of_gold, 1, error_message="input of medals not correct")#test get a medal count
  end
end