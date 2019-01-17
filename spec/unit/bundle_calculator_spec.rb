require 'bundle_calculator'
require 'flower'
require 'bundle_rule'

describe BundleCalculator do
  describe '.calculate' do
    context 'When can bundle according to the biggest rule exactly' do
      let(:bundle_rule_small) { BundleRule.new(5, 6.99) }
      let(:bundle_rule_big) { BundleRule.new(10, 12.99) }
      let(:flower) { Flower.new('Roses', 'R12', [bundle_rule_small, bundle_rule_big]) }

      it 'can bundle according to the biggest rule exactly' do
        bundle_result = BundleCalculator.bundle(flower, 10)
        expect(bundle_result.all_bundled?).to be_truthy
        expect(bundle_result.bundles).to eq(bundle_rule_big => 1)
      end

      it 'can bundle according to the biggest rule twice exactly' do
        bundle_result = BundleCalculator.bundle(flower, 20)
        expect(bundle_result.all_bundled?).to be_truthy
        expect(bundle_result.bundles).to eq(bundle_rule_big => 2)
      end
    end

    context 'When can bundle according to the biggest and second biggest rule ' do
      let(:bundle_rule_small) { BundleRule.new(3, 9.95) }
      let(:bundle_rule_medium) { BundleRule.new(6, 16.95) }
      let(:bundle_rule_big) { BundleRule.new(9, 24.95) }
      let(:flower) { Flower.new('Lilies', 'L09', [bundle_rule_small, bundle_rule_medium, bundle_rule_big]) }

      it 'should bundle according the biggest and second biggest rule' do
        bundle_result = BundleCalculator.bundle(flower, 15)
        expect(bundle_result.all_bundled?).to be_truthy
        expect(bundle_result.bundles).to eq(bundle_rule_big => 1, bundle_rule_medium => 1)
      end
    end

    context 'When can NOT bundle according to the biggest rule' do
      let(:bundle_rule_small) { BundleRule.new(3, 5.95)  }
      let(:bundle_rule_medium) { BundleRule.new(5, 9.95) }
      let(:bundle_rule_big) { BundleRule.new(9, 16.99) }
      let(:flower) { Flower.new('Tulips', 'T58', [bundle_rule_small, bundle_rule_medium, bundle_rule_big]) }

      it 'should bundle the second and third biggest rule' do
        bundle_result = BundleCalculator.bundle(flower, 13)
        expect(bundle_result.all_bundled?).to be_truthy
        expect(bundle_result.bundles).to eq(bundle_rule_medium => 2, bundle_rule_small => 1)
      end
    end

    context 'When can NOT fully bundle the flower' do
      let(:bundle_rule_small) { BundleRule.new(5, 6.99) }
      let(:bundle_rule_big) { BundleRule.new(10, 12.99) }
      let(:flower) { Flower.new('Roses', 'R12', [bundle_rule_small, bundle_rule_big]) }

      it 'should raise ArgumentError' do
        expect { BundleCalculator.bundle(flower, 7) }.to raise_error(ArgumentError)
      end
    end
  end
end
