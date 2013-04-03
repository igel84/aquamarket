#encoding: utf-8
module ProductsHelper
  def product_image(product)
    str = ''
    unless product.product_images.empty?
      str += link_to image_tag(product.product_images.first.image.thumb, alt: "изображение #{@product.name_with_brand}", align: "middle", border: "0"), product.product_images.first.image.url, title: product.name_with_brand, class: 'fancybox'
      if product.have_promotion? 
        str += content_tag :div, style:'position:absolute;top:10px;left:10px' do
          image_tag '/assets/akciya.png'
        end
      end
    end
    raw(str)
    #= link_to @product.product_images.first.image.medium.url, class: 'modal fancybox', :rel => "{handler:'image'}" do
    #  = image_tag(@product.product_images.first.image.thumb, :align => "middle", :alt => "#{@product.name}", :border => "0", :title => "#{@product.name}") unless @product.product_images.empty? 
  end

  def product_description(product)
    str = ''
    if product.have_promotion? 
      str += content_tag :div, style:'font-weight:bold' do
        content_tag(:p, 'Цена на данный товар снижена!') +
        content_tag(:p, "Цена без учета акции - #{product.price} рублей")
      end
    end
    str += product.description
    raw(str)
  end
end
