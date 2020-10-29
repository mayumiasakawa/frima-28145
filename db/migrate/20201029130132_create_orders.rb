class CreateOrders < ActiveRecord::Migration[6.0]
  has_one :shipping
  belongs_to :item
  def change
    create_table :orders do |t|

      t.timestamps
    end
  end
end
