class Cart
  attr_reader :items

  def initialize
    @items = []
  end

  def add_product product, quantity
    current_item = @items.find { |item| item.product == product }
    if current_item
      current_item.increment_quantity quantity
    else
      @items << CartItem.new product
    end
  end

end
