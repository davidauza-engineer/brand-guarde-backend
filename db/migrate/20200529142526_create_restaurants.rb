class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.references :chain, null: false, foreign_key: true, index: true
      t.references :country, null: false, foreign_key: true, index: true
      t.string :name, limit: 255, null: false, default: ''
      t.string :address, limit: 255, null: false, default: ''

      t.timestamps
    end
    add_index :restaurants, :name, unique: true
    add_index :restaurants, :address
  end
end
