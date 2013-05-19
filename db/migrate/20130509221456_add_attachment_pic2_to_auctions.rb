class AddAttachmentPic2ToAuctions < ActiveRecord::Migration
  def change
    add_attachment :auctions, :pic2
  end
end