require_relative "point"# get the point class
require_relative "swimming_location"# get the point class

class Terrain
  attr_accessor :plot_size
  attr_accessor :plot_cord
  attr_accessor :point_array
  attr_accessor :average_height
  attr_accessor :points_array

  def read_data (data_in)# loads data and puts it into the plot_cord variable
    input = File.open(data_in, File::RDONLY){|f| f.read }
    @plot_cord =  input.lines.map{|l| l.split.map(&:to_f) }#put cord into array
    @plot_size = @plot_cord[0][0]#get the size of the matrix
    @plot_cord.shift#remove size from array to leave only cord
    plot_points
    get_ave_height# get the average height.

  end
  def plot_points()
    y_count = 0
    @points_array = []
    @plot_cord.each do |val|
      x_count = 0

       val.each {|cord|
         point = Point.new(x_count,y_count,cord)#create new point object and add data in#####
         #p point
         @points_array << point
         x_count +=1
       }
      y_count += 1

    end
  end

  def get_ave_height
    ave_height = 0

    @plot_cord.each{|val|
      val.each {|height|
        ave_height = ave_height + height# add the value of all points
      }
    }
    @average_height = ave_height/(@plot_size*@plot_size)

  end
  def get_lowest_point
    min_height = 1000000
    x_co = 0 #x position
    y_co  = 0#y Position

    @points_array.each {|point|
      #p point.height
      if point.height < min_height
        min_height = point.height
        x_co = point.x_loc
        y_co = point.y_loc
      end
    }
    lowest_point = Point.new(x_co,y_co,min_height)
  end
  def get_standDeviation
    stand_dev = 0
    ave_heigth = get_ave_height# get average height
    @points_array.each {|point|
      stand_dev = stand_dev + ((point.height - ave_heigth)**2)
    }
    stand_output = Math.sqrt(stand_dev/(@plot_size*@plot_size))
    #p stand_output #for debug only


  end

end

tim = Terrain.new

tim.read_data ('C:/Users/max/Desktop/Reports PHP/terrain.dat')#enter your file location as input
swp = SwimmingLocation.new(tim.plot_cord)
swp.find_loc_for_pool
#p "standard deviation of all points = "+tim.get_standDeviation.to_s
#p "lowest point is ("+tim.get_lowest_point.x_loc.to_s+", "+tim.get_lowest_point.y_loc.to_s+") with a height of "+tim.get_lowest_point.height.to_s
#p "average height = " + tim.average_height.to_s



