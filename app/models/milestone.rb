class Milestone < ActiveRecord::Base
  attr_accessible :milestone_title, :milestone_content, :milestone_success, :milestone_on_time,
      :milestone_late, :milestone_timer, :milestone_user_accept, :filing_id

  belongs_to :filings
end
