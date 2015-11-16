require_relative "node"
class GameTree
  attr_accessor :t_value
  attr_accessor :root_node
  attr_accessor :height
  attr_accessor :branching_factor
  attr_accessor :approx
  attr_accessor :node_array# will be destroyed at end of tree building
  attr_accessor :height_count# for building the tree
  attr_accessor :node_type# boolean for changing between daughter nodes and interior nodes####true for daughter false for interior
  #other e values must be greater than equal to t

  def initialize(height, branching_factor, approx)
    @height = height #get inputs
    @height_count = height
    @branching_factor = branching_factor#get inputs
    @approx = approx#get inputs
    @node_array = []#initialise empty array of nodes
    @node_type = true # set to build daughters first
    get_t_value#get random t_value
    @root_node = RootNode.new
    @root_node.t_value = @t_value # give starting t value to buid tree from
    @node_array << @root_node# to be checked in further building of tree
    build_connecting_nodes(@root_node,@branching_factor)#build first daughters
    @node_type = !@node_type #change to enter next values of interior nodes
    @height_count = @height_count-1 #one layer done
    build_rest_of_tree()
  end

  def build_connecting_nodes(node,branching_factor)
    #if height > 0# check to see if reached leaves
    ##################################### daughter nodes
    if @node_type == true# build daughter nodes
      #puts "in daughter"
      for i in 0..branching_factor-1#create number nodes from branching factor number
        node_to_add = DaughterNode.new
        node.nodes << node_to_add
        @node_array << node_to_add
      end
      #chose best daughter
      best_daughter = get_random_best_node_number(branching_factor)
      #assign E values
      for i in 0..node.nodes.size-1############################################################################################################
        if i != best_daughter#set ######need to add check so doesnt get better then t value
          node.nodes[i].e_value = (node.t_value * -1) + get_random_approx####negate t value
          node.nodes[i].t_value = (node.t_value * -1) + get_random_approx # might not need
        end
        if i == best_daughter#set best daughter
          node.nodes[i].e_value = (node.t_value * -1)####negate t value
          node.nodes[i].t_value = (node.t_value * -1) # might not need
        end
      end

    #end #might need ifx
    ###############################################
    #if
    else @node_type == false# build interior nodes

      for i in 0..branching_factor - 1#create number nodes from branching factor number
        node_to_add = InteriorNode.new

        node.nodes << node_to_add###################need to add shuffling array
        @node_array << node_to_add
      end
      #chose best connecting node
      best_daughter = get_random_best_node_number(branching_factor)
      #assign E values
      for i in 0..node.nodes.size-1

        if i != best_daughter#set ######need to add check so doesnt get better then t value
          node.nodes[i].e_value = (node.t_value * -1) - get_random_approx####negate t value
          node.nodes[i].t_value = (node.t_value * -1) + get_random_approx # might not need
        end
        if i == best_daughter#set best daughter
          node.nodes[i].e_value = (node.t_value * -1)####negate t value
          node.nodes[i].t_value = (node.t_value * -1) # might not need
        end
      end
    end
    #end#end of if statement
  end# end of function

  def build_rest_of_tree()
    for i in 0 .. @height_count - 1
      #check each node to see if they have connecting nodes and if not create them and give them E values for all the rest of the tree
      for i in 0 .. @node_array.size - 1
        if @node_array[i].nodes.size == 0
          rand_branching_factor = get_random_branching()
          build_connecting_nodes(@node_array[i],rand_branching_factor)
        end
      end
      @node_type = !@node_type# to change between types of nodes and there inputted E values
    end


  end

  def get_random_branching()
    return_branching_factor = 0
    chance_of_one_less  = rand(1 ..10)#1 out of ten = 10%
    chance_of_one_more  = rand(1 ..10)#1 out of ten = 10%
    if chance_of_one_less == 1
      return_branching_factor = @branching_factor - 1
    elsif chance_of_one_more == 1
     return_branching_factor = @branching_factor + 1
    else
      return_branching_factor = @branching_factor
   end



  end



  def get_t_value#generates random T value
    @t_value = rand(-250 .. 250)
  end





  def give_e_value_to_node(input_node)
    if input_node.check_for_leaf_node

    end
  end

  def get_random_approx
    rand(0 .. @approx)
  end
  def get_random_best_node_number(branching_factor)
    rand(0 .. branching_factor - 1)# to chose random node from array
  end
end