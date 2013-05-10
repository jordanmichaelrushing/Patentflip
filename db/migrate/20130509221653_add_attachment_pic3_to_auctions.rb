class AddAttachmentPic3ToAuctions < ActiveRecord::Migration
  def self.up
    change_table :auctions do |t|
      t.attachment :pic3
    end
  end

  def self.down
    drop_attached_file :auctions, :pic3
  end
end
