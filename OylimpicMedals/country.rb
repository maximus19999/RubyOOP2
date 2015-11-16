class Country
  attr_accessor :name
  attr_accessor :num_of_gold
  attr_accessor :num_of_silver
  attr_accessor :num_of_bronze
  attr_accessor :population
  attr_accessor :gdps
  attr_accessor :gdps_hash_map


  def initialize(name, gold, silver, bronze, population)
    @name = name
    @num_of_gold = gold
    @num_of_silver = silver
    @num_of_bronze = bronze
    @population = population
  end
  def to_s
    @name+", "+@num_of_gold.to_s+", "+@num_of_silver.to_s+", "+@num_of_bronze.to_s+", "+@population.to_s
  end
  def load_gdp_data(gpd_in)
    input = File.open(gpd_in, File::RDONLY){|f| f.read }
    temp_array = input.lines.map{|l| l.split.map(&:to_s) }#put gdps into array for sorting
    @gdps_hash_map = Hash[*temp_array.flatten]# put into hash map
    temp_array.each{|sort_gdp_country|
      #puts sort_gdp_country
      #@gdps_hash_map = Hash.new
      #@gdps_hash_map[sort_gdp_country[0]]= sort_gdp_country[1].to_i
    }
  end
end

t = Country.new("ARG", 1,1,1, 40000000)#get new country

 t.load_gdp_data("gdp.txt")
#puts t.gdps_hash_map[0]
puts t.gdps_hash_map["AND"]





