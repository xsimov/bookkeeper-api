class CreateShoppingOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :shopping_orders do |t|
      t.belongs_to :provider

      t.string :description
      t.datetime :ordered_at, null: false
      t.datetime :estimated_arrival_at, null: false
      t.datetime :received_at
      t.integer :estimated_price_in_cents, default: 0
      t.integer :final_price_in_cents, default: 0
    end
  end
end
