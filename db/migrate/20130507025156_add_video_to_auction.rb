class AddAttachmentVideoToAuctions < ActiveRecord::Migration
  def self.up
    change_table :auctions do |t|
      t.string :vid
    end
  end

  def self.down
    drop_attached_file :auctions, :vid
  end
end