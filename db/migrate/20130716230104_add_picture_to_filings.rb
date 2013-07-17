class AddPictureToFilings < ActiveRecord::Migration
  def change
    add_attachment :filings, :picture
  end
end
