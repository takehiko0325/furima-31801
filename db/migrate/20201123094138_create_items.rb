class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name ,  null:  false
      t.text :explanation  ,  null:  false
      t.integer    :category_id     , null: false
      t.integer    :status_id     , null: false
      t.integer    :fee_id     , null: false
      t.integer    :delivery_source_region_id     , null: false
      t.integer    :preparetion_day_id     , null: false
      t.integer    :payment
      t.references :user,         null: false,foreign_key: true
      t.timestamps
    end
  end
end
