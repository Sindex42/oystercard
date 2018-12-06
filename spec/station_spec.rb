require 'station'

describe Station do
  let(:name) { double :name }
  let(:zone) { double :zone }

  subject { described_class.new(name, zone) }

  it 'has a name' do
    expect(subject.name).to eq name
  end

  it 'has a zone' do
    expect(subject.zone).to eq zone
  end
end
