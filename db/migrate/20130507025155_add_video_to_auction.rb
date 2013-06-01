class AddVideoToAuction < ActiveRecord::Migration
  def change
    add_attachment :auctions, :vid
  end
end