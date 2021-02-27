class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :name, null: false
      t.text    :explain, null: false
      t.integer :category_id, null: false
      t.integer :state_id, null: false
      t.integer :burden_id, null: false
      t.integer :prefecture_id, null: false
      t.integer :date_id, null: false
      t.integer :price, null: false
      t.integer :reference, foreign_key: true
      t.timestamps null: false
    end
  end 
end

