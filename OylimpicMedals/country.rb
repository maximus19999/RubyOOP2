class Gdp# a class to make the gdp hash map available to all countrys
  attr_accessor :gdps_hash_map
  def initialize
    load_gdp_data("gdp.txt")
  end
  def load_gdp_data(gpd_in)
    input = File.open(gpd_in, File::RDONLY){|f| f.read }
    temp_array = input.lines.map{|l| l.split.map(&:to_s) }#put gdps into array for sorting
    @gdps_hash_map = Hash[*temp_array.flatten]# put into hash map
  end
end


class Country < Gdp
  attr_accessor :name
  attr_accessor :num_of_gold
  attr_accessor :num_of_silver
  attr_accessor :num_of_bronze
  attr_accessor :population
  attr_accessor :score_value




  def initialize(name, gold, silver, bronze, population)
    super()#initialise Gdp class to have access to hash map of gdps
    @name = name
    @num_of_gold = gold
    @num_of_silver = silver
    @num_of_bronze = bronze
    @population = population
  end
  def to_s
    @name+", "+@num_of_gold.to_s+", "+@num_of_silver.to_s+", "+@num_of_bronze.to_s+", "+@population.to_s
  end
  def score
    score = ((@num_of_gold.to_f*3)+((@num_of_silver.to_f*2)+@num_of_bronze.to_f))/@gdps_hash_map[@name].to_f
  end
end


 # t = Country.new("USA", 42,56,20, 40000000)#get new country
 # puts t.score






