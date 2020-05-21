class AddInStockToListings < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :in_stock, :boolean, null: nil
  end 
end
