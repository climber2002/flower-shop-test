class BundleResult
  attr_reader :total_flowers, :remaining_flowers, :flower_code, :bundles

  def initialize(total_flowers, flower_code)
    @total_flowers = total_flowers
    @remaining_flowers = total_flowers
    @flower_code = flower_code
    @bundles = {}
  end

  def can_create_bundle?(bundle_rule)
    remaining_flowers >= bundle_rule.quantity
  end

  def create_bundle(bundle_rule)
    unless can_create_bundle?(bundle_rule)
      raise ArgumentError,
            "Can't create bundle, bundle quantity: #{bundle_rule.quantity}, remaining: #{remaining_flowers}"
    end

    add_bundle(bundle_rule)
    update_remaining(bundle_rule)
  end

  # Returns true if there is no remaining flowers that are not bundled
  def all_bundled?
    remaining_flowers.zero?
  end

  def total_bundled_price
    total = 0.0
    bundles.each do |bundle_rule, count|
      total += bundle_rule.price * count
    end

    total.round(2)
  end

  private

  def add_bundle(bundle_rule)
    if bundles.key?(bundle_rule)
      bundles[bundle_rule] += 1
    else
      bundles[bundle_rule] = 1
    end
  end

  def update_remaining(bundle_rule)
    @remaining_flowers -= bundle_rule.quantity
  end
end
