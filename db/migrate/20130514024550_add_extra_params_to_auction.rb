class AddExtraParamsToAuction < ActiveRecord::Migration
  def change
    add_column :auctions, :why_sell, :text
    add_column :auctions, :phone_num, :string
  end
end
