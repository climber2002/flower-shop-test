require 'bundle'

describe Bundle do
  subject { Bundle.new(5, 6.99) }

  it { expect(subject.quantity).to eq 5 }
  it { expect(subject.price).to eq 6.99 }

  describe '#==' do
    it { expect(subject == Bundle.new(5, 6.99)).to be_truthy }

    it { expect(subject == Bundle.new(4, 6.2)).to be_falsy }
  end
end