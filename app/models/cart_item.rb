class CartItem
  attr_reader :product, :quantity

  def initialize product, quantity
    @product = product
    @quantity = quantity
  end

  def increment_quantity quantity
    @quantity += quantity
  end

  def title
    @product.title
  end

  def price
    (@product.discount_price || @product.price) * @quantity
  end

end
