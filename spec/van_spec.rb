require 'van'

describe Van do
  let(:van) { described_class.new }
  let(:docking_station) { double(:docking_station) }
  let(:bike) { double(:bike) }

  it 'is empty by default' do
    expect(van.broken_bikes).to be_empty
  end

  it 'can collect broken bikes from docking stations' do
    allow(docking_station).to receive(:release_broken_bikes).and_return([bike])
    van.collect(docking_station)
    expect(van.broken_bikes).to include(bike)
  end
end
