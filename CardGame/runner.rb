require_relative"card"
require_relative"hand"

class Runner
end
tim = Card.new("king")
tim2 = Card.new("four")
tim3 = Card.new("queen")
tim4 = Card.new("two")
tim5 = Card.new("ace")
#puts tim.to_s
hand = Liar.new
#hand.printNow
hand.add_card(tim)
hand.add_card(tim2)
hand.add_card(tim3)
hand.add_card(tim4)
hand.add_card(tim5)
#hand.add_card(tim)
 #puts hand.max_num_cards
#puts hand.set_card_value(tim)
 #puts hand.cards
#puts tim.rank
   #hand.contains?(tim)
#hand.value(tim2)
puts hand.evaluate