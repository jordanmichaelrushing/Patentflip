class Auction < ActiveRecord::Base
  attr_accessible :category, :cost, :descrip, :img_url, :integer, :lic_or_sell, :pat_num, :pat_off_desc, :pat_type, :timer_day, :timer_hr, :timer_min, :title, :vid_url
end
