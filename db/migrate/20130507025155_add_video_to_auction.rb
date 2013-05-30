class AddVideoToAuction < ActiveRecord::Migration
  def self.up
    change_table :auctions do |t|
      t.string :vid
    end
  end
end