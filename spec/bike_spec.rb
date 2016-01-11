require 'bike'

describe Bike do
  let(:bike) { described_class.new }

  it 'can report a broken bike' do
    bike.report_broken
    expect(bike.working?).to be false
  end
end
