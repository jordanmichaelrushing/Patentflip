class AddCatSearchToAuctions < ActiveRecord::Migration
  def change
    add_column :auctions, :cat_search, :string
  end
end
