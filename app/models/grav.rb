class Grav < ActiveRecord::Base
  attr_accessible :content, :user_id 
 	
 	belongs_to :static_page
 	belongs_to :user

# 	def content
# 		:content
# 	end
end