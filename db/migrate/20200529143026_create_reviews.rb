class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.references :user, null: false, foreign_key: true, index: true
      t.references :restaurant, null: false, foreign_key: true, index: true
      t.text :body, limit: 1000, null: false, default: ''

      t.timestamps
    end
  end
end
