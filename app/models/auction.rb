class Auction < ActiveRecord::Base
  attr_accessible :category, :cost, :descrip, :img_url, :integer, :lic_or_sell, :pat_num, :pat_off_desc, :pat_type, :timer_day, :timer_hr, :timer_min, :title, :auction_attributes, :vid, :pic1, :pic2, :pic3, :pic4, :pic5, :vid_file_name, :pic1_file_name, :pic2_file_name, :pic3_file_name, :pic4_file_name, :pic5_file_name

	has_attached_file :pic1, styles: { medium: "500x500>" }
  has_attached_file :pic2, styles: { medium: "500x500>" } 
  has_attached_file :pic3, styles: { medium: "500x500>" }
  has_attached_file :pic4, styles: { medium: "500x500>" }
  has_attached_file :pic5, styles: { medium: "500x500>" }
  
  has_attached_file :vid, styles: { large: { geometry: "1280x720", format: 'flv'} }, processors: [:ffmpeg]
end
