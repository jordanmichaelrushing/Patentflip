class AddAttachmentPic2ToAuctions < ActiveRecord::Migration
  def self.up
    change_table :auctions do |t|
      t.attachment :pic2
    end
  end

  def self.down
    drop_attached_file :auctions, :pic2
  end
end
