require 'docking_station'

describe DockingStation do

  let(:docking_station) { described_class.new }
  let(:bike) { double(:bike) }

  it { should respond_to(:release_bike) }

  it 'can release working bikes' do
    bike = docking_station.release_bike
    expect(bike).to be_working
  end
end
