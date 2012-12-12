#encoding: utf-8
class Order < ActiveRecord::Base
  attr_accessible :email, :name, :phone, :adds
  has_many :order_items

  validates_presence_of :name, :message => 'поле ИМЯ должно быть заполнено'
  validates :email, :presence => true, 
                    :length => {:minimum => 3, :maximum => 254},
                    #:uniqueness => false,
                    :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}

  def summ
    order_items.sum{ |item| item.summ }
  end
end
