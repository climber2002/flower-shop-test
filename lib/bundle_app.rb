require_relative 'flower'
require_relative 'bundle_calculator'
require_relative 'bundle_results_writer'

class BundleApp
  def self.generate_bundles(input_lines)
    bundle_results = input_lines.map do |line|
      flower_quantity, code = line.strip.split(' ')
      flower = Flower.find(code)
      BundleCalculator.bundle(flower, Integer(flower_quantity))
    end

    BundleResultsWriter.new(bundle_results).write
  end
end
