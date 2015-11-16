class Country
  attr_accessor :name
  attr_accessor :num_of_gold
  attr_accessor :num_of_silver
  attr_accessor :num_of_bronze
  attr_accessor :population

  def initialize(name, gold, silver, bronze, population)
    @name = name
    @num_of_gold = gold
    @num_of_silver = silver
    @num_of_bronze = bronze
    @population = population


  end
  def read_data ()# loads data and puts it into the plot_cord variable
    input = File.open("medals.txt", File::RDONLY){|f| f.read }
    @countrys =  input.lines.map{|l| l.split.map(&:to_s) }#put cord into array
    # @plot_size = @plot_cord[0][0]#get the size of the matrix
    # @plot_cord.shift#remove size from array to leave only cord
    # plot_points
    # get_ave_height# get the average height.

  end
end


t = Country.new
t.read_data

puts t.countrys[0][0]
puts t.countrys[0][1]
puts t.countrys[0][2]
puts t.countrys[0][3]
puts t.countrys[0][4]
