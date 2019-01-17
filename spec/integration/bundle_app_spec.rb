require 'bundle_app'

describe BundleApp do
  let(:input_lines) do
    ['10 R12',
     '15 L09',
     '13 T58']
  end

  let(:expected_output) do
    "10 R12 $12.99\n" \
    "    1 x 10 $12.99\n" \
    "15 L09 $41.90\n" \
    "    1 x 9 $24.95\n" \
    "    1 x 6 $16.95\n" \
    "13 T58 $25.85\n" \
    "    2 x 5 $9.95\n" \
    "    1 x 3 $5.95\n"
  end

  describe '.generate_bundles' do
    it 'should generate correct output' do
      expect { BundleApp.generate_bundles(input_lines) }.to output(expected_output).to_stdout
    end
  end
end
