class SwimmingLocation
  attr_accessor :plot_cord
  attr_accessor :best_location
  attr_accessor :plot_size
  def initialize(plot_co,plot_size)
    @plot_cord = [0,0]
    @best_location = [0,0]
    @plot_cord = plot_co
    @best_location = [0,0,0,10000]#0's == x y size height
    @plot_size = plot_size
  end
  def find_loc_for_pool
    pool_y_loc = 0
    @plot_cord.each {|point|
      pool_x_loc = 0
      pool_y_loc_to_pass = 0
      pool_x_loc_to_pass = 0
      height_to_pass = 0
      pool_loc_size = 1
      point.each {|x_point|

        while point[pool_x_loc] == point[pool_x_loc + pool_loc_size]#find the next point next to it
          pool_loc_size += 1 # find potential pool size

          pool_y_loc_to_pass = pool_y_loc
          pool_x_loc_to_pass = pool_x_loc
          height_to_pass = point[pool_x_loc]

        end
        pool_x_loc += 1

      }

      if pool_loc_size > 1# check that there is at least two blocks togther
        if pool_y_loc < @plot_size - 1 # make sure not to look past plot sizing
          if check_rest_of_space(pool_x_loc_to_pass,pool_y_loc_to_pass,pool_loc_size,height_to_pass)
            sort_best_location(pool_x_loc_to_pass,pool_y_loc_to_pass,pool_loc_size,height_to_pass)
            #show_best_location
          end
        end


      end
      pool_y_loc += 1


    }




  end

  def check_rest_of_space(x,y,size_of_pool,height)
    size_count_y = 1#start at one to increment
    size_count_x = 1
    (size_of_pool-1).times {#minus 1 to start at right spot
      if height == @plot_cord[y + size_count_y][x]
        (size_of_pool-1).times {#minus 1 to start at right spot
          if @plot_cord[y + size_count_y][x + size_count_x] == height
            #pass first test
          else
            return false
          end
          size_count_x += 1
        }

      else
        return false
      end

      if size_count_y == size_of_pool - 1 # check to make sure size of pool is right
        #pass second test
        return true
      end
      size_count_y += 1
      size_count_x = 1
    }
    size_count_y = 1#start at one to increment

  end
  def sort_best_location(x,y,size,height)
    if size > @best_location[2] ## check for size
      @best_location = [x,y,size,height]
    else
      if @best_location[2] == size && @best_location[3] > height #if size is equal check height
        @best_location = [x,y,size,height]
      end
    end
  end

  def show_best_location
   display =  "best location is (x = " + @best_location[0].to_s+ ", y = "+@best_location[1].to_s+") sized = "+@best_location[2].to_s+"*"+@best_location[2].to_s+" at height = "+@best_location[3].to_s
  end
end