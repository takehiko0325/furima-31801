class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|
    t.string :post_number,    default: "",  null: false
    t.integer :delivery_source_region_id,                  null: false
    t.string :city,           default: ""  ,  null: false
    t.string :address,   default: ""   ,  null: false
    t.string :building_name,  default: ""  
    t.string :phone_number,  default: "",  null: false
    t.references :users_items ,     foreign_key: true
    t.timestamps
    end
  end
end