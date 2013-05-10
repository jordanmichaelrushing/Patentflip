class AddAttachmentPic5ToAuctions < ActiveRecord::Migration
  def self.up
    change_table :auctions do |t|
      t.attachment :pic5
    end
  end

  def self.down
    drop_attached_file :auctions, :pic5
  end
end
