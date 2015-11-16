require_relative "country"
class MedalRankings
  attr_accessor :countrys
  def initialize(data_to_read)#reads in data
    read_data(data_to_read)
  end
  def to_s(array_num)
    @countrys[array_num].to_s
  end
  def read_data (data_in)# loads data and puts it into the countrys variable
    @countrys = []#initialise empty array
    input = File.open(data_in, File::RDONLY){|f| f.read }
    temp = input.lines.map{|l| l.split.map(&:to_s) }#put countrys into array for sorting
    temp.each{|country|#initialse and sort
      count = Country.new(country[0],country[1].to_i,country[2].to_i ,country[3].to_i ,country[4].to_i)
      @countrys << count
    }
  end
  def most_golds#get the country with highest number of gold
    most_gold_country = "xxx"
    most_gold_count = 0
    @countrys.each {|country|
      if country.num_of_gold > most_gold_count
        most_gold_count = country.num_of_gold
        most_gold_country = country
      end
    }
    most_gold_country
  end
  def average_pop#get average population
    average = 0
    @countrys.each {|country|
      average = average + country.population
    }
    average = average/@countrys.size
  end
  def sort!
    @countrys.each {|country|
      country.score_value = country.score#give each country a score value
    }
    @countrys.sort! { |a,b| a.score_value <=> b.score_value } #sort by score
    @countrys.reverse!#reverse for decending order
  end
  def each_single_gold_winner
    single_gold_winners = []
    @countrys.each {|country|
      if country.num_of_gold == 1 and country.num_of_silver == 0 and country.num_of_bronze == 0
        single_gold_winners << country
      end
    }
    single_gold_winners.sort! { |a,b| a.name <=> b.name} #sort by score
  end
end



