require 'journey'

describe Journey do

  let(:entry_station) { double :entry_station }
  let(:exit_station) { double :exit_station }

  subject { described_class.new(entry_station) }

  it 'starts a journey' do
    expect(subject.entry_station).to eq entry_station
  end

  it 'finishes a journey' do
    expect(subject.exit(exit_station)).to eq exit_station
  end

  it 'creates one journey' do
    subject.exit(exit_station)
    expect(subject.trip).to eq({ entry_station: entry_station, exit_station: exit_station })
  end

  # it 'calculates the fare of the journey' do
  #
  # end
  #
  # it 'returns if journey is complete' do
  #
  # end
end
