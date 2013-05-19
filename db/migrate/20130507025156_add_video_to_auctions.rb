class AddAttachmentVideoToAuctions < ActiveRecord::Migration
  def change
  	add_attachment :auctions, :video_upload
	end
end