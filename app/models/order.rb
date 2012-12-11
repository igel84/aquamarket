#encoding: utf-8
class Order < ActiveRecord::Base
  attr_accessible :email, :name, :phone, :adds
  has_many :order_items

  validates_presence_of :name, :message => 'поле ИМЯ должно быть заполнено'
  validates :email, :presence => true, 
                    :length => {:minimum => 3, :maximum => 254},
                    :uniqueness => true,
                    :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}
end
