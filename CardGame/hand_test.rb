require 'test/unit'
require_relative 'hand'
require_relative 'card'
class HandTest < Test::Unit::TestCase

  def setup

    @tim = Card.new("king")
    @tim2 = Card.new("four")
    @tim3 = Card.new("queen")
    @tim4 = Card.new("two")
    @tim5 = Card.new("ace")
  end
  def test_add_card_two_card
    hand = Liar.new
    hand.add_card(@tim)
    assert_equal(hand.cards[0].name, "king", error_message="card failed to add")
  end
  def test_complete
    hand = Liar.new
    hand.add_card(@tim)
    assert_equal(hand.complete?, false, error_message="failed to complete adding card")

    hand.add_card(@tim2)
    assert_equal(hand.complete?, true, error_message="failed to complete adding card")
  end
  def test_contains
    hand = Liar.new
    hand.add_card(@tim)
    assert_equal(hand.contains?(@tim), true, error_message="does not contain card")
  end
  def test_value
    hand = Liar.new
    hand.add_card(@tim)
    assert_equal(hand.cards[0].rank, 1, error_message="did not assign real value for giving card")
  end
  def test_evaluate
    hand = Liar.new
    hand.add_card(@tim)
    hand.add_card(@tim2)
    assert_equal(hand.evaluate, 5.5, error_message="failed to evaluate correctly")
  end
  def test_five_card_adding
    hand = Spider.new
    hand.add_card(@tim)
    hand.add_card(@tim2)
    assert_equal(hand.complete?, false, error_message="failed to complete adding card")
    hand.add_card(@tim3)
    hand.add_card(@tim4)
    hand.add_card(@tim5)
    assert_equal(hand.complete?, true, error_message="failed to complete adding card")
  end


end