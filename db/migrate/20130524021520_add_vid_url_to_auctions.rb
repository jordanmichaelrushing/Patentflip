class AddVidUrlToAuctions < ActiveRecord::Migration
  def change
    add_column :auctions, :vid_url, :string
  end
end
