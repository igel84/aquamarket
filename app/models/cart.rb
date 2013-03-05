class Cart
  attr_reader :items

  def initialize
    @items = []
  end

  def add_product(product, product_type, quantity=1)
    if product_type == nil
      current_item = @items.find { |item| item.product == product }
      if current_item
        current_item.increment_quantity(quantity)
      else
        @items << CartItem.new(product, nil, quantity)
      end
    else
      current_item = @items.find { |item| item.product_type == product_type }
      if current_item
        current_item.increment_quantity(quantity)
      else
        @items << CartItem.new(product, product_type, quantity)
      end
    end
  end

  def price
    @items.sum{ |item| item.price }
  end

  def quantity
    @items.sum{ |item| item.quantity }
  end

  def conversion(product, product_type, product_quantity)
    if product_type.nil?
      current_item = @items.find { |item| item.product == product }
      if current_item
        product_quantity == 'sub' ? current_item.set_quantity(current_item.quantity - 1) : current_item.set_quantity(current_item.quantity + 1)
      else
        @items << CartItem.new(product, product_quantity)
      end
    else
      current_item = @items.find { |item| item.product_type == product_type }
      if current_item
        product_quantity == 'sub' ? current_item.set_quantity(current_item.quantity - 1) : current_item.set_quantity(current_item.quantity + 1)
      else
        @items << CartItem.new(product, product_type, product_quantity)
      end
    end
  end

  def destroy_item(product, product_type)
    if product_type.nil?
      @items.delete_if { |item| item.product.id == product.to_i }
    else
      @items.delete_if { |item| item.product.id == product.to_i && item.product_type.id == product_type.to_i }
    end
  end

  def empty?
    self.items.empty?
  end

  def empty!
    @items.delete_if { |i| true }
  end

end
