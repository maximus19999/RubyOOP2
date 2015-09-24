class Terrain
  attr_accessor :plot_size
  attr_accessor :plot_cord


  def read_data (data_in)# loads data and puts it into the plot_cord variable
    input = File.open(data_in, File::RDONLY){|f| f.read }
    @plot_cord =  input.lines.map{|l| l.split.map(&:to_i) }
  end


end

tim = Terrain.new

tim.read_data ('C:/Users/max/Desktop/Reports PHP/Terrain.dat')
p tim.plot_cord


