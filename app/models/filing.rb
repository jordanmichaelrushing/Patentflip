class Filing < ActiveRecord::Base
  attr_accessible :milestone_title, :milestone_content, :milestone_success, 
  :milestone_on_time, :milestone_late, :milestone_timer, :milestone_user_accept, 
  :pay_per_milestone, :picture, :user_accept_filing, :filing_title, :filing_content,
  :picture_file_name, :user_current_filing_amount, :user_success_filing, 
  :filing_user_name, :filing_lawyer_name, :job_category, :job_descrip, :milestones_attributes, 
  :filing_id

  extend FriendlyId
  friendly_id :filing_title, use: [:slugged, :history]

  has_attached_file :picture, styles: { big: "591x313", mid: "250x250>", micro: "100x100>" }

  has_one :user
  has_many :milestones
  accepts_nested_attributes_for :milestones
end