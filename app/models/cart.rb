class Cart
  attr_reader :items

  def initialize
    @items = []
  end

  def add_product(product, quantity=1)
    current_item = @items.find { |item| item.product == product }
    if current_item
      current_item.increment_quantity(quantity)
    else
      @items << CartItem.new(product, quantity)
    end
  end

  def price
    @items.sum{ |item| item.price }
  end

  def quantity
    @items.sum{ |item| item.quantity }
  end

  def conversion(product, product_quantity=1)
    current_item = @items.find { |item| item.product == product }
    if current_item
      current_item.set_quantity(product_quantity)
    else
      @items << CartItem.new(product, product_quantity)
    end
  end

  def destroy_item(product)
    @items.delete_if { |item| item.product.id == product.to_i }
  end

  def empty?
    self.items.empty?
  end

  def empty!
    @items.delete_if { |i| true }
  end

end
