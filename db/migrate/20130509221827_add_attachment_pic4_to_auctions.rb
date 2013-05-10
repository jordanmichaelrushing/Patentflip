class AddAttachmentPic4ToAuctions < ActiveRecord::Migration
  def self.up
    change_table :auctions do |t|
      t.attachment :pic4
    end
  end

  def self.down
    drop_attached_file :auctions, :pic4
  end
end
