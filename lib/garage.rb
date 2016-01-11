class Garage
  attr_reader :broken_bikes, :fixed_bikes

  def initialize
    @broken_bikes = []
    @fixed_bikes = []
  end

  def accept_broken_bikes(van)
    van.release_broken_bikes.each { |broken_bike| @broken_bikes << broken_bike }
  end

  def repair
    @broken_bikes.each(&:fixme)
    @broken_bikes.each { |bike| fixed_bikes << bike }
    @broken_bikes.each { |bike| broken_bikes.delete(bike) }
  end

  def release_fixed_bikes
    fixed_bikes
  end
end
