require_relative 'bundle_rule'

class Flower
  attr_reader :name, :code, :bundle_rules

  def initialize(name, code, bundle_rules = [])
    @name = name
    @code = code
    @bundle_rules = bundle_rules.sort { |a, b| b.price <=> a.price }
  end

  @all_flowers = { 'R12' => Flower.new('Roses', 'R12', [BundleRule.new(5, 6.99),
                                                        BundleRule.new(10, 12.99)]),
                   'L09' => Flower.new('Lilies', 'L09', [BundleRule.new(3, 9.95),
                                                         BundleRule.new(6, 16.95),
                                                         BundleRule.new(9, 24.95)]),
                   'T58' => Flower.new('Tulips', 'T58', [BundleRule.new(3, 5.95),
                                                         BundleRule.new(5, 9.95),
                                                         BundleRule.new(9, 16.99)]) }
  def self.find(code)
    @all_flowers.fetch(code) { |code| raise ArgumentError, "Code #{code} is not found" }
  end
end
