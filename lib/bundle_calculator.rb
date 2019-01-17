module BundleCalculator
  def self.bundle(flower, flower_quantity)
    bundle_rules = flower.bundle_rules
    loop do
      bundle_result = BundleResult.new(flower_quantity, flower.code)
      generate_bundle(bundle_result, bundle_rules)
      return bundle_result if bundle_result.all_bundled?

      bundle_rules = bundle_rules.drop(1)
      break if bundle_rules.empty?
    end
    raise ArgumentError, "Can't fully bundle the flower. flower_quantity: #{flower_quantity}"
  end

  private

  def self.generate_bundle(bundle_result, bundle_rules)
    return bundle_result if bundle_result.all_bundled? || bundle_rules.empty?

    bundle_rule, *rest_rules = bundle_rules
    while bundle_result.can_create_bundle?(bundle_rule)
      bundle_result.create_bundle(bundle_rule)
    end
    generate_bundle(bundle_result, rest_rules)
  end
end
