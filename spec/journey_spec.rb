require 'journey'

describe Journey do

  let(:entry_station) { double :entry_station }
  let(:exit_station) { double :exit_station }

  it 'is not in a journey by default' do
    expect(subject).not_to be_in_journey
  end

  context 'has an entry_station' do
    before { subject.add_entry(entry_station) }

    it 'starts a journey' do
      expect(subject.add_entry(entry_station)).to eq entry_station
    end

    it 'checks if in a journey' do
      expect(subject).to be_in_journey
    end

    context 'has an exit_station' do
      before { subject.add_exit(exit_station) }

      it 'finishes a journey' do
        expect(subject.add_exit(exit_station)).to eq exit_station
      end

      it 'creates one journey' do
        expect(subject.trip).to eq [entry_station: entry_station, exit_station: exit_station]
      end

      context 'has been reset' do
        before { subject.reset }

        it 'forgets entry_station' do
          expect(subject.entry_station).to be_falsey
        end

        it 'forgets exit exit_station' do
          expect(subject.exit_station).to be_falsey
        end
      end
    end
  end
end


      # it 'calculates the fare of the journey' do
      #
      # end
      #
      # it 'returns if journey is complete' do
      #
      # end
