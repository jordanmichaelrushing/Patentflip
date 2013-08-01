class AddBusinessBuyToAuctions < ActiveRecord::Migration
  def change
    add_column :auctions, :business_buy_id, :integer
    add_column :auctions, :business_buy_name, :string
  end
end
