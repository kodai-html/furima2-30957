class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postal_code,    default: "",  null: false
      t.integer :prefecture_id,               null: false
      t.string :municipality,   default: "",  null: false
      t.string :address,        default: "",  null: false
      t.string :building,       default: ""
      t.string :number,                       null: false
      t.references :order,                    null: false,  foreign_key: true
      t.timestamps
    end
  end
end
