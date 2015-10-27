require_relative "card"
class Hand

  attr_accessor :cards_values
  attr_accessor :cards
  attr_accessor :max_num_cards
  attr_accessor :evaluation_type
  def initialize
    @num_of_cards = 0#set nuber of cards
    @cards  = []#create empty card array
  end
  def add_card(card)
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

class EvaluateHands < Hand
  def initialize
    super()
  end
  def evaluate ()
    if @evaluation_type == "median"# for spider
      card_array = []
      @cards.each {|card|
        card_array.push(card.rank)
      }
      card_array.sort
      card_array [2]#return median
    end
    if @evaluation_type == "high_low_ave"
      max_min = get_high_low_cards()
      (max_min[0].to_f + max_min[1])/@max_num_cards# add to_f to convert to float
    end
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

class TwoHandedGames < EvaluateHands
  def initialize
    super()
    @max_num_cards = 2
  end
end

class FiveHandedGames < EvaluateHands
  def initialize
    super()
    @max_num_cards = 5
  end
end

class Idiot < TwoHandedGames
  def initialize
    super()
    @evaluation_type = "high_low_ave"
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

class Spider < FiveHandedGames
  def initialize
    super()
    @evaluation_type = "median"
    @cards_values = {#to get value of card
                     "ace" => 0,
                     "two" => 0,
                     "three" => 0,
                     "four" => 0,
                     "five" => 0,
                     "six" => 0,
                     "seven" => 0,
                     "eight" => 0,
                     "nine" => 0,
                     "ten" => 0,
                     "jack" => 3,
                     "queen" => 2,
                     "king" => 1,
    }
  end
end
class Liar < TwoHandedGames
  def initialize
    super()
    @evaluation_type = "high_low_ave"
    @cards_values = {#to get value of card
                     "ace" => 13,
                     "two" => 12,
                     "three" => 11,
                     "four" => 10,
                     "five" => 9,
                     "six" => 8,
                     "seven" => 7,
                     "eight" => 6,
                     "nine" => 5,
                     "ten" => 4,
                     "jack" => 3,
                     "queen" => 2,
                     "king" => 1,
    }
  end
end
class Light < FiveHandedGames
  def initialize
    super()
    @evaluation_type = "high_low_ave"
    @cards_values = {#to get value of card
                     "ace" => 1,
                     "two" => 13,
                     "three" => 12,
                     "four" => 4,
                     "five" => 3,
                     "six" => 10,
                     "seven" => 9,
                     "eight" => 2,
                     "nine" => 7,
                     "ten" => 11,
                     "jack" => 5,
                     "queen" => 8,
                     "king" => 1,
    }
  end
end