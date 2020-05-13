class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.string :title
      t.references :user
      t.text :description
      t.integer :price
      t.references :category

      t.timestamps
    end
  end
end
