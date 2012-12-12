class CreateDeliveries < ActiveRecord::Migration
  def change
    create_table :deliveries do |t|
      t.string :email
      t.timestamps
    end

    Delivery.create(email: 'igel.yulian@gmail.com')
  end
end
