require 'docking_station'

describe DockingStation do
  let(:docking_station) { described_class.new }
  let(:bike) { double(:bike) }

  it { should respond_to(:release_bike) }

  it 'can release working bikes' do
    docking_station.dock(bike)
    docking_station.release_bike
    expect(docking_station.bikes).not_to include bike
  end

  it 'a bike can be docked' do
    docking_station.dock(bike)
    expect(docking_station.bikes).to include(bike)
  end

  it 'raises and error if station is empty' do
    error = 'Sorry, no bikes available.'
    expect { docking_station.release_bike }.to raise_error error
  end

  it 'doesn\'t allow docking of bikes once full' do
    error = 'Sorry, docking station is full.'
    docking_station.capacity.times { docking_station.dock(bike) }
    expect { docking_station.dock(bike) }.to raise_error error
  end

  it 'has a default capacity' do
    expect(docking_station.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it 'has changeble capacity' do
    docking_station_2 = described_class.new(30)
    error = 'Sorry, docking station is full.'
    docking_station_2.capacity.times { docking_station_2.dock(bike) }
    expect { docking_station_2.dock(bike) }.to raise_error error
  end
end
