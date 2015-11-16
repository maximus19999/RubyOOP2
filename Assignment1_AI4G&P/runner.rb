require_relative "node"
require_relative "game_tree"
class Runner
end


#puts "Enter A"
#a = gets.chomp

y = rand(-250 .. 250)

x = GameTree.new(3,9,50)
puts x.t_value.to_s+"t value"
x.node_array.each {|nodes|
  puts nodes.e_value
}
#puts x.node_array
#puts x.t_value