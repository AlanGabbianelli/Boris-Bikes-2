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

  it 'can release broken bikes to the garage' do
    allow(docking_station).to receive(:release_broken_bikes).and_return([bike])
    van.collect(docking_station)
    expect(van.release_broken_bikes).to include(bike)
  end

  it 'doesn\'t include broken bikes once released to the garage' do
    allow(docking_station).to receive(:release_broken_bikes).and_return([bike])
    van.collect(docking_station)
    van.release_broken_bikes
    expect(van.broken_bikes).to be_empty
  end
end
