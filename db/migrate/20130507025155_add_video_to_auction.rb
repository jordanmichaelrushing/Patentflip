class AddVideoToAuction < ActiveRecord::Migration
  def self.up
    change_table :auctions do |t|
      t.attachment :vid
    end
  end
end