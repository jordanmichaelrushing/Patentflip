class Auction < ActiveRecord::Base
  attr_accessible :category, :cost, :descrip, :img_url, :integer, :lic_or_sell, 
  :pat_num, :pat_off_desc, :pat_type, :timer_day, :timer_hr, :timer_min, :title,
    :auction_attributes, :pic1, :pic2, :pic3, :pic4, :pic5, 
    :pic1_file_name, :pic2_file_name, :pic3_file_name, :pic4_file_name, 
    :pic5_file_name, :vid_url, :pic_descr_1, :pic_descr_2, :pic_descr_3, 
    :pic_descr_4, :pic_descr_5, :goog_url, :video, :video_file_name

  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]
	
  has_attached_file :pic1, styles: { a: "600x400>", tiny: "250x250>" }
  has_attached_file :pic2, styles: { a: "600x400>", tiny: "250x250>" } 
  has_attached_file :pic3, styles: { a: "600x400>", tiny: "250x250>" }
  has_attached_file :pic4, styles: { a: "600x400>", tiny: "250x250>" }
  has_attached_file :pic5, styles: { a: "600x400>", tiny: "250x250>" }
  has_attached_file :video
  validates :title, presence: {message: 'Patent title cannot be blank'}
  validates :pat_num, presence: {message: 'Patent number cannot be blank'}
  #validates :category, presence: {message: 'Patent category cannot be blank'}  
  validates :pat_off_desc, presence: {message: "You need to have your official patent description. Otherwise businesses won't take you seriously"}
  validates :descrip, presence: {message: 'Your personal description should not be blank'}
  #validates :lic_or_sell, presence: {message: 'You need to specify if you want to sell or license your patent'}
  validates :pic1, presence: {message: 'You need to have at least one picture in the first picture spot'}
  validates :pic_descr_1, presence: {message: 'You need to have a description for your picture'}

  has_one :user
end