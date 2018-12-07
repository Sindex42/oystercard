require 'journey'

describe Journey do
  let(:entry_station) { double :entry_station }
  let(:exit_station) { double :exit_station }

  it 'is not in a journey by default' do
    expect(subject).to be_incomplete
  end

  context 'has an entry_station' do
    before { subject.add_entry(entry_station) }

    it 'starts a journey' do
      expect(subject.add_entry(entry_station)).to eq entry_station
    end

    context 'has an exit_station' do
      before { subject.add_exit(exit_station) }

      it 'finishes a journey' do
        expect(subject.add_exit(exit_station)).to eq exit_station
      end

      it 'has a complete journey' do
        expect(subject).not_to be_incomplete
      end

      it 'creates one journey' do
        expect(subject.trip).to eq [entry_station: entry_station, exit_station: exit_station]
      end

      context 'has been reset' do
        before { subject.reset }

        it 'forgets entry_station' do
          expect(subject.entry_station).to be_falsey
        end

        it 'forgets exit_station' do
          expect(subject.exit_station).to be_falsey
        end

        it 'has an incomplete journey' do
          expect(subject).to be_incomplete
        end
      end
    end
  end

  describe '#fare' do
    context 'has a complete journey' do
      it 'returns the minimum fare' do
        subject.add_entry(entry_station)
        subject.add_exit(exit_station)

        expect(subject.fare).to eq Oystercard::MIN_FARE
      end
    end

    context 'has no entry_station' do
      it 'returns the penalty fare' do
        subject.add_exit(exit_station)

        expect(subject.fare).to eq Oystercard::PENALTY_FARE
      end
    end

    context 'has no exit_station' do
      it 'returns the penalty fare' do
        subject.add_entry(entry_station)

        expect(subject.fare).to eq Oystercard::PENALTY_FARE
      end
    end
  end
end
