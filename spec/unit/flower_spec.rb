require 'flower'
require 'bundle'

describe Flower do
  subject do
    Flower.new('Lilies', 'L09', [
                 Bundle.new(6, 16.95),
                 Bundle.new(3, 9.95),
                 Bundle.new(9, 24.95)
               ])
  end

  it { expect(subject.name).to eq 'Lilies' }
  it { expect(subject.code).to eq 'L09' }

  it 'should sort the bundles by price descending order' do
    expect(subject.bundles).to eq [Bundle.new(9, 24.95),
                                   Bundle.new(6, 16.95),
                                   Bundle.new(3, 9.95)]
  end
end
