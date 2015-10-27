require_relative "card"
class Hand

  attr_accessor :cards_values
  attr_accessor :cards
  attr_accessor :max_num_cards
  def initialize
    @num_of_cards = 0#set nuber of cards
  end
  def add_card(card)#####need to add check for card already existing
    if complete? == false #check that number of card hasnt been filled already or if it contains card
     if  contains?(card) == false
       set_card_value(card)
       @num_of_cards = @num_of_cards + 1
       @cards << card #put card into
     else
       #puts "card already exists"
     end

    else
      #puts "hand complete/card already exists"
    end
  end
  def complete?#check to see if hand has been allocated max number of cards
    if @num_of_cards < @max_num_cards#not full yet
       false
    else
      if @num_of_cards == @max_num_cards#full
        true
      end
    end
  end
  def set_card_value(card)#get card value and add to card
    card.rank = @cards_values[card.to_s]
  end

  def contains?(card)
    if @cards.include?(card)# check if the card already exists
      #puts "found"
      true
    else
      false
    end
  end
  def value(card)#get value from hash map
    @cards_values[card.to_s]

  end

end

# module Evaluate_for_idiot_liar_light #using a module to impliment
#   def eval_idiot_liar_light (cards, num_cards)
#     max_min = get_high_low_cards(cards)
#     (max_min[0].to_f + max_min[1])/num_cards# add to_f to convert to float
#   end
#   def get_high_low_cards(cards)
#     max = 0
#     min = 100
#     cards.each { |card|
#       if card.rank < min
#         min = card.rank
#       end
#       if card.rank > max
#         max = card.rank
#       end
#     }
#     [max,min]
#   end
# end

class Evaluate < Hand
  def initialize
    super()
  end
  def evaluate_high_low_average_games ()
    max_min = get_high_low_cards()
    (max_min[0].to_f + max_min[1])/@max_num_cards# add to_f to convert to float
  end
  def get_high_low_cards()#get max and min
    max = 0
    min = 100
    @cards.each { |card|
      if card.rank < min
        min = card.rank
      end
      if card.rank > max
        max = card.rank
      end
    }
    [max,min]
  end





end
class Two_handed_games < Evaluate
  def initialize
    super()
    @max_num_cards = 2
  end
end
class Five_handed_games < Evaluate
  def initialize
    super()
    @max_num_cards = 5
  end
end


class Idiot < Two_handed_games
  #include Evaluate_for_idiot_liar_light
  def initialize
    super()
    @cards  = []
    @cards_values = {#to get value of card
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