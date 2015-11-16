class RootNode
  attr_accessor :e_value # can be returned as a static evaluation with just node.e_value
  attr_accessor :t_value# will be erased
  attr_accessor :nodes
  attr_accessor :nodes_for_shuffling

  def initialize()
    @nodes = []
    @nodes_for_shuffling = []

  end

  def chech_for_leaf_node#check to see if daughers exist
    if @nodes.length > 0
      false #has daughters
    else
      true #is leaf node
    end
  end
end





class InteriorNode
  attr_accessor :e_value # can be returned as a static evaluation with just node.e_value
  attr_accessor :t_value# will be erased
  attr_accessor :nodes
  attr_accessor :nodes_for_shuffling

  def initialize()
    @nodes = []
    @nodes_for_shuffling = []

  end

  def chech_for_leaf_node#check to see if daughers exist
    if @nodes.length > 0
      false #has daughters
    else
      true #is leaf node
    end
  end
end


class DaughterNode
  attr_accessor :e_value # can be returned as a static evaluation with just node.e_value
  attr_accessor :t_value# will be erased
  attr_accessor :nodes
  attr_accessor :nodes_for_shuffling

  def initialize()
    @nodes = []
    @nodes_for_shuffling = []

  end

  def chech_for_leaf_node#check to see if daughers exist
    if @nodes.length > 0
      false #has interior nodes
    else
      true #is leaf node
    end
  end
end