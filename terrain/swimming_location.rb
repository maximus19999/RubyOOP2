class SwimmingLocation
  attr_accessor :plot_cord
  attr_accessor :possible_locations
  def initialize(plot_co)
    @plot_cord = plot_co
  end
  def find_loc_for_pool
    #possible_locations = []

    pool_y_loc = 0
    @plot_cord.each {|point|
      pool_x_loc = 0
      pool_y_loc_to_pass = 0
      pool_x_loc_to_pass = 0
      height_to_pass = 0
      pool_loc_size = 1
      point.each {|x_point|

        while point[pool_x_loc] == point[pool_x_loc + pool_loc_size]#find the next point next to it
          pool_loc_size +=1 # find potential pool size
          #pool_y_loc_to_pass = pool_y_loc# pass out y location
          #p point[pool_x_loc]
          pool_y_loc_to_pass = pool_y_loc
          pool_x_loc_to_pass = pool_x_loc
          height_to_pass = point[pool_x_loc]
          #p pool_y_loc
          #p pool_x_loc
        end
        pool_x_loc += 1
        #if pool_x_loc > 9# to stop checking the far right points
          #break
        #end
      }

      if pool_loc_size > 1# check that there is at least two blocks togther
       # p "found"
        #p pool_loc_size
        if check_rest_of_space(pool_x_loc_to_pass,pool_y_loc_to_pass,pool_loc_size,height_to_pass)
          #p pool_x_loc_to_pass
          #p pool_y_loc_to_pass
          #p pool_loc_size
          #p height_to_pass
        end
        #break
      end
      pool_y_loc += 1

    }
    


  end

  def check_rest_of_space(x,y,size_of_pool,height)
    size_count_y = 1#start at one to increment
    size_count_x = 1
    (size_of_pool-1).times {#minus 1 to start at right spot
      #p size_of_pool
      #p "doing"
      #p @plot_cord[y+size_count_y][x]
      #p x
      #p y
      if height == (@plot_cord[(y + size_count_y)][x])
        #p @plot_cord[(y + size_count_y )][x].to_s
        #p "x = " + (x + size_count_x).to_s + " y = "+ (y + size_count_y).to_s + " "+@plot_cord[y + size_count_y][x].to_s
        #break
        (size_of_pool-1).times {#minus 1 to start at right spot
          if @plot_cord[(y + size_count_y)][(x + size_count_x)] == height
            #p "x = " + (x + size_count_x).to_s + " y = "+ (y + size_count_y).to_s + " "+@plot_cord[(y + size_count_y)][x].to_s
          else
            return false
          end
          size_count_x += 1
        }

      else
      return false
      end

      if size_count_y == size_of_pool - 1 # check to make sure size of pool is right
        p "x = " + x.to_s + " y = " + y.to_s + " size = "+ size_of_pool.to_s + " height =" +height.to_s
        return true

      end

      size_count_y += 1
      size_count_x = 1
      #if size_count_y == size_of_pool + 1
        #p "pass"
        #p x
        #p y
       # p "size of pool " + size_of_pool.to_s
        #return true
      #end
    }
    size_count_y = 1#start at one to increment


    #size_count_y = 1#start at one to increment
    #size_count_x = 1

  end
end