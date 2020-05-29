class CreateChains < ActiveRecord::Migration[6.0]
  def change
    create_table :chains do |t|
      t.string :name, limit: 255, null: false, default: ''

      t.timestamps
    end
  end
  add_index :chains, :name, unique: true
end
