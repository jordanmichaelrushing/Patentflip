class Auction < ActiveRecord::Base
  attr_accessible :category, :cost, :descrip, :img_url, :integer, :lic_or_sell, :pat_num, :pat_off_desc, :pat_type, :timer_day, :timer_hr, :timer_min, :title, :vid, :pic1, :pic2, :pic3, :pic4, :pic5
	
	has_attached_file :pic1, styles: { medium: "300x300>" }, default_url: "/assets/coolguy_:style.png"
  has_attached_file :pic2, styles: { large: "500x500>" }, default_url: "/assets/coolguy_:style.png"
  has_attached_file :pic3, styles: { large: "500x500>" }, default_url: "/assets/coolguy_:style.png"
  has_attached_file :pic4, styles: { large: "500x500>" }, default_url: "/assets/coolguy_:style.png"
  has_attached_file :pic5, styles: { large: "500x500>" }, default_url: "/assets/coolguy_:style.png"
  
  has_attached_file :vid, styles: { fla: { geometry: "1280x720", format: 'flv', streaming: true }, win: { geometry: "1280x720", format: 'wmv', streaming: true } }, processors: [:ffmpeg]
	validates :vid, attachment_presence: true
end
