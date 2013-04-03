#encoding: utf-8
module ApplicationHelper

  def menu
    @menu = ''
    @menu_items.try(:each) { |item| @menu << menu_item(item) }
    content_tag( :ul, raw(@menu))
  end
  
  def promotion(product)
    str = ''
    if product.have_promotion? 
      str = content_tag :div, style:'position:absolute;top:-60px;left:-10px' do
        image_tag '/assets/akciya.png'
      end
    end
    str += 'Подробнее...'
    raw(str)
  end  

  private

    def menu_item(item)
      @i = ''
      subitems = MenuItem.where(parent_id: item.id).each { |i| @i << content_tag(:li, link_to(i.name, "/" + @locale.to_s + i.url)) } 
      sub_menu = content_tag(:ul, raw(@i))
      content_tag(:li, link_to(item.name, item.url) + sub_menu)
    end

end
