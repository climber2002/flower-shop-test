require 'flower'
require 'bundle_rule'

describe Flower do
  subject do
    Flower.new('Lilies', 'L09', [
                 BundleRule.new(6, 16.95),
                 BundleRule.new(3, 9.95),
                 BundleRule.new(9, 24.95)
               ])
  end

  it { expect(subject.name).to eq 'Lilies' }
  it { expect(subject.code).to eq 'L09' }

  it 'should sort the bundle_rules by price descending order' do
    expect(subject.bundle_rules).to eq [BundleRule.new(9, 24.95),
                                        BundleRule.new(6, 16.95),
                                        BundleRule.new(3, 9.95)]
  end
end
