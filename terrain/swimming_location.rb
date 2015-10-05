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
      pool_loc_size = 1
      point.each {|y_point|
        #p pool_x_loc.to_s
        #p pool_y_loc.to_s
        while point[pool_x_loc] == point[pool_x_loc + pool_loc_size]#find the next point next to it
          pool_loc_size +=1
          p point[pool_x_loc]
        end
        if pool_loc_size >2# check that there is atleast two blocks togther

        end
        break

        pool_y_loc += 1
      }
      pool_x_loc += 1
    }

  end
end