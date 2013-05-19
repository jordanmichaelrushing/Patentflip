class AddAttachmentVideoToAuctions < ActiveRecord::Migration
  def change
  	add_string :auctions, :vid
	end
end