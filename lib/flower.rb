class Flower
  attr_reader :name, :code, :bundle_rules

  def initialize(name, code, bundle_rules = [])
    @name = name
    @code = code
    @bundle_rules = bundle_rules.sort { |a, b| b.price <=> a.price }
  end
end
