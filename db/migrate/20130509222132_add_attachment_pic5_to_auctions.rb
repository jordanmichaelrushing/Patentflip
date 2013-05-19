class AddAttachmentPic5ToAuctions < ActiveRecord::Migration
  def change
    add_attachment :auctions, :pic5
  end
end