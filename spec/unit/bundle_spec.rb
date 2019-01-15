require 'bundle'

describe Bundle do
  subject { Bundle.new(5, 6.99) }

  it { expect(subject.quantity).to eq 5 }
  it { expect(subject.price).to eq 6.99 }
end