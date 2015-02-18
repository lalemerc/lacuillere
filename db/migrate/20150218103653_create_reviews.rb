class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :content
      t.integer :rating
      t.references :restaurant, index: true

      t.timestamps null: false
    end
    add_foreign_key :reviews, :restaurants
  end
end
