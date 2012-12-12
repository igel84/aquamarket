#encoding: utf-8
class OrderMailer < ActionMailer::Base
  default from: 'aquamarket@mlip.ru'

  def order_email(order)
    @order = order
    Delivery.all.each do |delivery|
      mail(to: delivery.email, subject: 'новый заказ')
    end
  end

end