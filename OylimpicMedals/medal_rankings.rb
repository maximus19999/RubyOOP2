require_relative "country"
class MedalRankings
  attr_accessor :countrys

  def initialize(data_to_read)
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
end

t = MedalRankings.new("medals.txt")
puts t.to_s(0)