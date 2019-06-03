class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :item_id
      t.integer :user_id
      t.string :picture
      t.string :review
      t.integer :rating
      t.boolean :orderagain
      t.string :name

      t.timestamps
    end
  end
end
