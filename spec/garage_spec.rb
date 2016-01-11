require 'garage'
describe Garage do
  let(:garage) { described_class.new }
  let(:van) { double(:van) }
  let(:bike) { double(:bike) }

  it 'accepts broken bikes from the van' do
    allow(van).to receive(:release_broken_bikes).and_return([bike])
    garage.accept_broken_bikes(van)
    expect(garage.broken_bikes).not_to be_empty
  end
end
