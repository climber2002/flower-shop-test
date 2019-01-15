class Flower
  attr_reader :name, :code, :bundles

  def initialize(name, code, bundles = [])
    @name = name
    @code = code
    @bundles = bundles.sort { |a, b| b.price <=> a.price }
  end
end
