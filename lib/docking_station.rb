class DockingStation
  attr_reader :bikes
  attr_accessor :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def release_bike
    fail 'Sorry, no bikes available.' if empty?
    fail 'Can\'t release broken bike' unless @bikes.last.working?
    bikes.pop
  end

  def dock(bike)
    fail 'Sorry, docking station is full.' if full?
    bikes << bike
  end

  def release_broken_bikes
    released_bikes = []
    bikes.each { |bike| released_bikes << bike unless bike.working? }
    bikes.each { |bike| bikes.delete(bike) unless bike.working? }
    released_bikes
  end

  private

  def full?
    bikes.size >= @capacity
  end

  def empty?
    bikes.empty?
  end
end
