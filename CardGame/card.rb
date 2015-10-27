class Card
  attr_accessor :rank
  attr_accessor :name


  def initialize(name)#gets name and rank
    #@rank = rank
    @name = name
  end
  def to_s
    @name
  end

end