require_relative "point"

class Terrain
  attr_accessor :plot_size
  attr_accessor :plot_cord
  attr_accessor :point_array

  def read_data (data_in)# loads data and puts it into the plot_cord variable
    input = File.open(data_in, File::RDONLY){|f| f.read }
    @plot_cord =  input.lines.map{|l| l.split.map(&:to_i) }#put cord into array
    @plot_size = @plot_cord[0][0]#get the size
    @plot_cord.shift#remove size from array to leave only cord
    plot_points
  end
  def plot_points()
    count = 0
    @plot_cord.each do |val|
       val.each {|cord|

       }
      p count
      count +=1
    end
  end

end

tim = Terrain.new

tim.read_data ('C:/Users/max/Desktop/Reports PHP/Terrain.dat')




