class CreateFurimas < ActiveRecord::Migration[6.0]
  def change
    create_table :furimas do |t|
      t.string :furima_name,    null: false
      t.integer :category_id,   null: false
      t.integer :price,         null: false
      t.integer :day_id,       null: false
      t.integer :status_id,     null: false
      t.text    :details,       null: false
      t.integer :delivery_id,    null: false
      t.integer  :prefecture_id,  null: false
      t.references :user,      foreign_key: true
      t.timestamps
    end
  end
end
