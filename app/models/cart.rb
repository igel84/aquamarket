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

end
