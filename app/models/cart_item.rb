class CartItem
  attr_reader :product, :product_type, :quantity

  def initialize(product, product_type, quantity=1)
    @product = product
    @product_type = product_type
    @quantity = quantity.to_i
  end

  def increment_quantity(quantity)
    @quantity += quantity.to_i
  end

  def set_quantity(quantity)
    @quantity = quantity.to_i
  end

  def name
    @product_type == nil ? @product.name : @product.name + " - " + @product_type.name
  end

  def price
    (@product.discount_price || @product.price) * @quantity
  end

end
