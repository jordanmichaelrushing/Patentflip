class AddAttachmentPic4ToAuctions < ActiveRecord::Migration
  def change
    add_attachment :auctions, :pic4
  end
end