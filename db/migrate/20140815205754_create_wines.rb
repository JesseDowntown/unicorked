class CreateWines < ActiveRecord::Migration
  def change
    create_table :wines do |t|
      t.string :brand
      t.string :type
      t.integer :year
      t.string :picture
      t.string :price
      t.integer :rating
      t.text :description
      t.string :color
      t.boolean :bubbly
      t.references :user

      t.timestamps
    end
  end
end
