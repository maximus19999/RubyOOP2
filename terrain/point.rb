class Point
  attr_accessor :x_loc
  attr_accessor :y_loc
  attr_accessor :height

  def initialize (x,y,height)
    @x_loc = x
    @y_loc = y
    @height = height
  end
end