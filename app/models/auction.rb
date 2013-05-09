class Auction < ActiveRecord::Base
  attr_accessible :category, :cost, :descrip, :img_url, :integer, :lic_or_sell, :pat_num, :pat_off_desc, :pat_type, :timer_day, :timer_hr, :timer_min, :title, :vid, :pic1, :pic2, :pic3, :pic4, :pic5, :pic1_file_name, :pic2_file_name, :pic3_file_name, :pic4_file_name, :pic5_file_name, 
	
	has_attached_file :pic1, styles: { medium: "300x300>" }, default_url: "/assets/coolguy_:style.png", :storage => :s3,
     :s3_credentials => "#{Rails.root}/config/s3.yml",
     :path => "/:style/:id/:filename"
  has_attached_file :pic2, styles: { large: "500x500>" }, default_url: "/assets/coolguy_:style.png", :storage => :s3,
     :s3_credentials => "#{Rails.root}/config/s3.yml",
     :path => "/:style/:id/:filename"
  has_attached_file :pic3, styles: { large: "500x500>" }, default_url: "/assets/coolguy_:style.png", :storage => :s3,
     :s3_credentials => "#{Rails.root}/config/s3.yml",
     :path => "/:style/:id/:filename"
  has_attached_file :pic4, styles: { large: "500x500>" }, default_url: "/assets/coolguy_:style.png", :storage => :s3,
     :s3_credentials => "#{Rails.root}/config/s3.yml",
     :path => "/:style/:id/:filename"
  has_attached_file :pic5, styles: { large: "500x500>" }, default_url: "/assets/coolguy_:style.png", :storage => :s3,
     :s3_credentials => "#{Rails.root}/config/s3.yml",
     :path => "/:style/:id/:filename"
  
  has_attached_file :vid, styles: { medium: { geometry: "1280x720", format: 'flv'} }, processors: [:ffmpeg], :storage => :s3,
     :s3_credentials => "#{Rails.root}/config/s3.yml",
     :path => "/:style/:id/:filename"
	validates :vid, attachment_presence: true
end
