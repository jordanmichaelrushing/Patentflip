class AddDescripsToAuction < ActiveRecord::Migration
  def change
    add_column :auctions, :pic_descr_1, :string
    add_column :auctions, :pic_descr_2, :string
    add_column :auctions, :pic_descr_3, :string
    add_column :auctions, :pic_descr_4, :string
    add_column :auctions, :pic_descr_5, :string
  end
end
