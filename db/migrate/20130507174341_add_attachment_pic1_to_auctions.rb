class AddAttachmentPic1ToAuctions < ActiveRecord::Migration
  def self.up
    change_table :auctions do |t|
      t.attachment :pic1
    end
  end

  def self.down
    drop_attached_file :auctions, :pic1
  end
end
