#encoding: utf-8
class Product < ActiveRecord::Base

  has_ancestry

  attr_accessible :product_id, :catalogue_section_id, :name, :preview, :description, :price, :discount_price, :quantity
  attr_accessible :product_images_attributes, :product_attributes, :product_types_attributes, :brand_id, :position, :promotions_attributes
  
  has_many :product_images, dependent: :destroy
  belongs_to :catalogue_section

  belongs_to :brand

  has_many :order_items

  has_many :promotions, dependent: :destroy
  accepts_nested_attributes_for :promotions, allow_destroy: true
  
  accepts_nested_attributes_for :product_images, allow_destroy: true
  validates :catalogue_section_id, presence: true
  serialize :product_attributes, Array
  
  has_many :product_types, dependent: :destroy
  accepts_nested_attributes_for :product_types, allow_destroy: true  

  default_scope order('position')

  def product_attributes_enum
    ProductAttribute.all.collect { |attr| ["#{attr.name}: #{attr.value}", attr.id] }
  end 

  def additional_attributes
    product_attributes.delete_if { |i| i.empty? }
    ProductAttribute.find(product_attributes.uniq)
  end
  
  def name_with_brand
    if brand
      brand.name + ' - ' + name
    else
      name
    end
  end

  def full_name
    if product_types.first
      name + ' - ' + product_types.first.name
    else
      name
    end
  end

  def actual_promotions
    promos = []
    unless promotions.empty?
      promotions.each {|promo| promos << promo if promo.start_at <= DateTime.now && (promo.finish_at.nil? || promo.finish_at >= DateTime.now) }
    end
    promos
  end

  def have_promotion?
    !actual_promotions.empty?
  end

  def full_price
    full_price = 0      
    if have_promotion?
      actual_promotions.each do |promo|
        full_price = promo.value if promo.kind == 'sale'
      end
    else
      full_price = price
    end
    full_price
  end

end
