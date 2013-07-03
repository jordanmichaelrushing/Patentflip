class AddAttachmentPic1ToAuctions < ActiveRecord::Migration
  def change
    add_attachment :auctions, :pic1
  end
end