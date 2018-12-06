require 'journey'

describe Journey do

  let(:entry_station) { double :entry_station }

  subject { described_class.new(entry_station) }

  it 'starts a journey' do
    expect(subject.entry_station).to eq entry_station
  end

  # it 'finishes a journey' do
  #
  # end
  #
  # it 'calculates the fare of the journey' do
  #
  # end
  #
  # it 'returns if journey is complete' do
  #
  # end
end
