class CartItem
  attr_reader :product, :quantity

  def initialize(product, quantity=1)
    @product = product
    @quantity = quantity
  end

  def increment_quantity(quantity=1)
    @quantity += quantity
  end

  def name
    @product.name
  end

  def price
    (@product.discount_price || @product.price) * @quantity
  end

end
