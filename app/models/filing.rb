class Filing < ActiveRecord::Base
  attr_accessible :milestone_title, :milestone_content, :milestone_success, 
  :milestone_on_time, :milestone_late, :milestone_timer, :milestone_user_accept, 
  :user_accept_filing, :pay_per_milestone, :filing_title, :filing_content, :picture, 
  :picture_file_name, :user_current_filing_amount, :user_success_filing, 
  :filing_user_name, :filing_lawyer_name, :job_category, :job_descrip

  extend FriendlyId
  friendly_id :filing_title, use: [:slugged, :history]

  has_attached_file :picture, styles: { big: "600x400>", mid: "250x250>", micro: "60x60>" }

  has_one :user
end