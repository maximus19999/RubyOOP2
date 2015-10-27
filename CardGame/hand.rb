require_relative "card"
class Hand
  attr_accessor :num_of_cards
  attr_accessor :cards_values
  attr_accessor :cards
  attr_accessor :max_num_cards

  def add_card(card)#####need to add check for card already existing
    if complete? == false #check that number of card hasnt been filled already or if it contains card
     if  contains?(card) == false
       set_card_value(card)
       @num_of_cards = @num_of_cards + 1
       @cards << card #put card into
       #puts "card added"
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

end
class Idiot < Hand
  def initialize
    #@cards_values = Hash.new
    @cards  = []
    @max_num_cards = 2
    @num_of_cards = 0
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
  # def complete?
  #
  # end
  # def contains?(card)
  #
  # end
  # def value(card)
  #
  # end
  # def evaluate
  #
  # end



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