require_relative "point"# get the point class

class Terrain
  attr_accessor :plot_size
  attr_accessor :plot_cord
  attr_accessor :point_array
  attr_accessor :average_height

  def read_data (data_in)# loads data and puts it into the plot_cord variable
    input = File.open(data_in, File::RDONLY){|f| f.read }
    @plot_cord =  input.lines.map{|l| l.split.map(&:to_f) }#put cord into array
    @plot_size = @plot_cord[0][0]#get the size
    @plot_cord.shift#remove size from array to leave only cord
    #plot_points
    get_ave_height
  end
  def plot_points()
    x_count = 0
    @plot_cord.each do |val|
      y_count = 0
       val.each {|cord|
       }
      p x_count
       x_count +=1
    end
  end

  def get_ave_height
    ave_height = 0
    num_of_point = 0
    @plot_cord.each{|val|
      val.each {|height|
        ave_height = ave_height + height# add the value of all points
        num_of_point +=1# add the number of points
      }
    }
    @average_height = ave_height/num_of_point
    #puts ave_height/num_of_point# just for debug
  end

end

tim = Terrain.new

tim.read_data ('C:/Users/max/Desktop/Reports PHP/terrain.dat')
puts "average height = " + tim.average_height.to_s




