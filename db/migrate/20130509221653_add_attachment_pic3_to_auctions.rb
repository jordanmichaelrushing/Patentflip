class AddAttachmentPic3ToAuctions < ActiveRecord::Migration
  def change
    add_attachment :auctions, :pic3
  end
end