class AddAttachmentVideoToAuctions < ActiveRecord::Migration
  def change
    add_attachment :auctions, :video
  end
end