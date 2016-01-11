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
    bikes.pop
  end

  def dock(bike)
    fail 'Sorry, docking station is full.' if full?
    bikes << bike
  end

  private

  def full?
    bikes.size >= @capacity
  end

  def empty?
    bikes.empty?
  end
end
