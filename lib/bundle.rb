class Bundle
  attr_reader :quantity, :price

  def initialize(quantity, price)
    @quantity = quantity
    @price = price
  end

  def ==(o)
    self.class == o.class &&
      quantity == o.quantity &&
      price == o.price
  end
end
