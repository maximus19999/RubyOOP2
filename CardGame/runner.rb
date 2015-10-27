require_relative"card"
require_relative"hand"

class Runner
end
tim = Card.new("ace")
puts tim.to_s
hand = Idiot.new
hand.set_card_value(tim)

