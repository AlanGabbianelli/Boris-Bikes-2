require 'garage'
describe Garage do
  let(:garage) { described_class.new }
  let(:van) { double(:van) }
  let(:bike) { double(:bike) }

  it 'accepts broken bikes from the van' do
    allow(van).to receive(:release_broken_bikes).and_return([bike])
    garage.accept_broken_bikes(van)
    expect(garage.broken_bikes).to include(bike)
  end

  it 'repairs bikes' do
    allow(van).to receive(:release_broken_bikes).and_return([bike])
    allow(bike).to receive(:fixme).and_return(true)
    garage.accept_broken_bikes(van)
    garage.repair
    expect(garage.broken_bikes).to be_empty
  end

  it 'put fixed bikes to new array' do
    allow(van).to receive(:release_broken_bikes).and_return([bike])
    allow(bike).to receive(:fixme).and_return(true)
    garage.accept_broken_bikes(van)
    garage.repair
    expect(garage.fixed_bikes).to include(bike)
  end

  it 'releases fixed bikes to the van' do
      allow(van).to receive(:release_broken_bikes).and_return([bike])
      allow(bike).to receive(:fixme).and_return(true)
      garage.accept_broken_bikes(van)
      garage.repair
      expect(garage.release_fixed_bikes).to include(bike)
  end


end
