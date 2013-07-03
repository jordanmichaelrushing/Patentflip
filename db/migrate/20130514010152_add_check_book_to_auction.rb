class AddCheckBookToAuction < ActiveRecord::Migration
  def change
    add_column :auctions, :goog_url, :boolean, default: false
  end
end
