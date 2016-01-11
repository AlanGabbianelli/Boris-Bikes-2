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
end
