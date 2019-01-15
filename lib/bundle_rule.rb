class BundleRule
  attr_reader :quantity, :price

  def initialize(quantity, price)
    @quantity = quantity
    @price = price
  end

  def ==(other)
    self.class == other.class &&
      quantity == other.quantity &&
      price == other.price
  end
end
