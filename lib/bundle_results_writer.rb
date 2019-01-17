# This class is responsible to write a list of bundle_results to an IO
class BundleResultsWriter
  attr_reader :bundle_results, :output

  def initialize(bundle_results, output = $stdout)
    @bundle_results = bundle_results
    @output = output
  end

  def write
    bundle_results.each do |bundle_result|
      write_bundle_result(bundle_result)
    end
  end

  private

  def write_bundle_result(bundle_result)
    output << "#{bundle_result.total_flowers} #{bundle_result.flower_code} $#{format('%.2f', bundle_result.total_bundled_price)}\n"
    bundle_result.bundles.each do |bundle_rule, count|
      output << "    #{count} x #{bundle_rule.quantity} $#{format('%.2f', bundle_rule.price)}\n"
    end
  end
end
