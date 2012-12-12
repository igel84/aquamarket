#encoding: utf-8
class AddStatusToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :status, :string, default: 'в ожидании оплаты'
  end
end
