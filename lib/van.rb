class Van
  attr_reader :broken_bikes
  def initialize
    @broken_bikes = []
  end

  def collect(docking_station)
    docking_station.release_broken_bikes.each do |broken_bike|
      @broken_bikes << broken_bike
    end
  end

  def release_broken_bikes
    released_bikes = []
    broken_bikes.each { |bike| released_bikes << bike }
    broken_bikes.each { |bike| broken_bikes.delete(bike) }
    released_bikes
  end
end
