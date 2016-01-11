require 'bike'

describe Bike do
  let(:bike) { described_class.new }

  it 'to be initialized as working' do
    expect(bike).to be_working
  end

  it 'can report a broken bike' do
    bike.report_broken
    expect(bike.working?).to be false
  end

  it 'can be fixed' do
    bike.report_broken
    bike.fixme
    expect(bike.working?).to be(true)
  end
end
