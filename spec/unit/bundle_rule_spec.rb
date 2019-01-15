require 'bundle_rule'

describe BundleRule do
  subject { BundleRule.new(5, 6.99) }

  it { expect(subject.quantity).to eq 5 }
  it { expect(subject.price).to eq 6.99 }

  describe '#==' do
    it { expect(subject == BundleRule.new(5, 6.99)).to be_truthy }

    it { expect(subject == BundleRule.new(4, 6.2)).to be_falsy }
  end
end
