class AddSlugToAuctions < ActiveRecord::Migration
  def change
    add_column :auctions, :slug, :string
    add_index :auctions, :slug, unique: true
  end
end
