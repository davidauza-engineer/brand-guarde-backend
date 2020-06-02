class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name, limit: 255, null: false, default: ''
      t.string :email, limit: 255, null: false, default: ''
      t.string :password_digest, limit: 255, null: false, default: ''

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
