require 'bundle_result'

describe BundleResult do
  describe '#initialize' do
    subject { BundleResult.new(15, 'L09') }

    it { expect(subject.total_flowers).to eq 15 }
    it { expect(subject.flower_code).to eq 'L09' }
    it { expect(subject.remaining_flowers).to eq 15 }
    it { expect(subject.bundles.empty?).to be_truthy }
  end

  describe '#create_bundle and #can_create_bundle?' do
    let(:bundle_rule) { BundleRule.new(4, 6.99) }

    subject { BundleResult.new(10, 'L09') }

    context 'when there is no bundle yet' do
      it { expect(subject.can_create_bundle?(bundle_rule)).to be_truthy }
    end

    context 'when there is enough remaining flowers and bundle once' do
      before do
        subject.create_bundle(bundle_rule)
      end

      it 'should decrease corresponding remaining flowers' do
        expect(subject.remaining_flowers).to eq 10 - 4
      end

      it 'should have correct bundles' do
        expect(subject.bundles).to eq(bundle_rule => 1)
      end

      it { expect(subject.all_bundled?).to be_falsy }
    end

    context 'when there is enough remaining flowers and bundle twice' do
      before do
        subject.create_bundle(bundle_rule)
        subject.create_bundle(bundle_rule)
      end

      it 'should decrease corresponding remaining flowers' do
        expect(subject.remaining_flowers).to eq 10 - 4 * 2
      end

      it 'should have correct bundles' do
        expect(subject.bundles).to eq(bundle_rule => 2)
      end

      it { expect(subject.all_bundled?).to be_falsy }
    end

    context 'when there is no enough remaining flowers' do
      before do
        subject.create_bundle(bundle_rule)
        subject.create_bundle(bundle_rule)
      end

      it { expect(subject.can_create_bundle?(bundle_rule)).to be_falsy }

      it 'should raise ArgumentError' do
        expect { subject.create_bundle }.to raise_error(ArgumentError)
      end
    end

    context 'create_bundle for different bundle rule' do
      let(:bundle_rule2) { BundleRule.new(2, 2.99) }

      before do
        subject.create_bundle(bundle_rule)
        subject.create_bundle(bundle_rule)
        subject.create_bundle(bundle_rule2)
      end

      it { expect(subject.remaining_flowers).to eq 0 }

      it { expect(subject.all_bundled?).to be_truthy }

      it 'should have correct bundles' do
        expect(subject.bundles).to eq(bundle_rule => 2, bundle_rule2 => 1)
      end
    end
  end

  describe '#total_bundled_price' do
    subject { BundleResult.new(15, 'L09') }

    context 'when no bundled' do
      it { expect(subject.total_bundled_price).to eq 0.0 }
    end

    context 'when has multiple bundles' do
      let(:bundle_rule) { BundleRule.new(4, 6.99) }
      let(:bundle_rule2) { BundleRule.new(2, 2.99) }

      before do
        subject.create_bundle(bundle_rule)
        subject.create_bundle(bundle_rule)
        subject.create_bundle(bundle_rule2)
      end

      it { expect(subject.total_bundled_price).to eq 6.99 * 2 + 2.99 }
    end
  end
end
