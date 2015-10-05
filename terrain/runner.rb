require_relative "point"# get the point class
require_relative "swimming_location"# get the point class
require_relative "terrain"# get the point class

class Runner
end

#######
#######
######## AN EMPTY RUNNER FILE JUST TO RUN THE CODE
#######
#######
######
tim = Terrain.new
tim.read_data ('C:/Users/max/Desktop/Reports PHP/terrain.dat')#enter your file location as input
p "standard deviation of all points = "+tim.get_standDeviation.to_s
p "lowest point is ("+tim.get_lowest_point.x_loc.to_s+", "+tim.get_lowest_point.y_loc.to_s+") with a height of "+tim.get_lowest_point.height.to_s
p "average height = " + tim.average_height.to_s
swp = SwimmingLocation.new(tim.plot_cord, tim.plot_size) # give data to swimming to find best spot
swp.find_loc_for_pool #sort data
p swp.show_best_location