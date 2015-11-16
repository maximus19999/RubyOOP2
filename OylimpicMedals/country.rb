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
  def to_s
    @name+", "+@num_of_gold.to_s+", "+@num_of_silver.to_s+", "+@num_of_bronze.to_s+", "+@population.to_s
  end

end



