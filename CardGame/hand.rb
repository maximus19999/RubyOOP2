require_relative "card"
class Hand
  attr_accessor :num_of_cards
  attr_accessor :cards
  def initialize
    @cards = Hash.new

  end
=begin
  def initialize

  end
  def add_card(card)

  end
  def complete?

  end
  def contains?(card)

  end
  def value(card)

  end
  def evaluate

  end
=end

end
class Idiot <Hand


  def add_card(card)

  end
  def complete?

  end
  def contains?(card)

  end
  def value(card)

  end
  def evaluate

  end

  def set_card_value(card)
    cards = {#to get value of card
        "ace" => 1,
        "two" => 2,
        "three" => 3,
        "four" => 4,
        "five" => 5,
        "six" => 6,
        "seven" => 7,
        "eight" => 8,
        "nine" => 9,
        "ten" => 10,
        "jack" => 11,
        "queen" => 12,
        "king" => 13,
    }
    puts cards[card.to_s]
  end

end
# class Liar <Hand
#   # def initialize
#   #
#   # end
#   def add_card(card)
#
#   end
#   def complete?
#
#   end
#   def contains?(card)
#
#   end
#   def value(card)
#
#   end
#   def evaluate
#
#   end
#
# end
# class Light <Hand
#   # def initialize
#   #
#   # end
#   def add_card(card)
#
#   end
#   def complete?
#
#   end
#   def contains?(card)
#
#   end
#   def value(card)
#
#   end
#   def evaluate
#
#   end
#
# end
# class Spider <Hand
#   # def initialize
#   #
#   # end
#   def add_card(card)
#
#   end
#   def complete?
#
#   end
#   def contains?(card)
#
#   end
#   def value(card)
#
#   end
#   def evaluate
#
#   end
#
# end