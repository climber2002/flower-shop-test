require 'bundle_result'

describe BundleResult do
  subject { BundleResult.new(15, 'L09') }

  it { expect(subject.total_flowers).to eq 15 }
  it { expect(subject.flower_code).to eq 'L09' }
  it { expect(subject.remaining_flowers).to eq 15 }
end
