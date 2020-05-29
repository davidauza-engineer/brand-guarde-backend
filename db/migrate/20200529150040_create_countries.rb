class CreateCountries < ActiveRecord::Migration[6.0]
  def change
    create_table :countries do |t|
      t.string :name, limit: 255, null: false

      t.timestamps
    end
    add_index :countries, :name, unique: true
  end
end
