class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
      t.string :cuisine
      t.string :location
      t.integer :website

      t.timestamps
    end
  end
end
