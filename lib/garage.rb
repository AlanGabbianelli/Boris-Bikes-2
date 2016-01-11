class Garage
  attr_reader :broken_bikes

  def initialize
    @broken_bikes = []
  end

  def accept_broken_bikes(van)
    van.release_broken_bikes.each { |broken_bike| @broken_bikes << broken_bike }
  end
end
