class SwimmingLocation
  attr_accessor :plot_cord
  attr_accessor :possible_locations
  def initialize(plot_co)
    @plot_cord = plot_co
  end
  def find_loc_for_pool
    possible_locations = []

    pool_x_loc = 0
    @plot_cord.each {|point|
      pool_y_loc = 0
      pool_y_loc_to_pass = 0
      pool_loc_size = 1
      point.each {|y_point|
        #p pool_x_loc.to_s
        #p pool_y_loc.to_s
        while point[pool_x_loc] == point[pool_x_loc + pool_loc_size]#find the next point next to it
          pool_loc_size +=1 # find potential pool size
          pool_y_loc_to_pass = pool_y_loc# pass out y location
          p point[pool_x_loc]
        end
        pool_y_loc += 1# might not need

      }
      if pool_loc_size >1# check that there is at least two blocks togther
        p "found"
        #p pool_loc_size
        check_rest_of_space(pool_x_loc,pool_y_loc_to_pass,pool_loc_size)
        break
      end

      pool_x_loc += 1
    }

  end

  def check_rest_of_space(x,y,size_of_pool)
    p x
    p y
    p size_of_pool
  end
end