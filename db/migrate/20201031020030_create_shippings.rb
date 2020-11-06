class CreateShippings < ActiveRecord::Migration[6.0]
  def change
    create_table :shippings do |t|
      t.string:postal_code, default: "", null: false
      t.integer:orefecture,               null: false
      t.string:city,          default:"", null: false
      t.string:house_number,  default:"", null: false
      t.string:building_name
      t.string:phone_number,  default:"", null: false
      t.timestamps
    end
  end
end
