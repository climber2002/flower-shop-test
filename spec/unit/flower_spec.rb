require 'flower'
require 'bundle_rule'

describe Flower do
  describe '#initialize' do
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
  
  describe '.find' do
    context 'when the code exists' do
      it 'should return correct flower' do
        flower = Flower.find('R12')
        expect(flower.name).to eq 'Roses'
        expect(flower.code).to eq 'R12'
        expect(flower.bundle_rules).to eq [BundleRule.new(10, 12.99), BundleRule.new(5, 6.99)]
      end
    end

    context 'when the code does not exist' do
      it { expect { Flower.find('NON') }.to raise_error(ArgumentError) }
    end
  end
end
