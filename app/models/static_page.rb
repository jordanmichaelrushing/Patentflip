class StaticPage < ActiveRecord::Base
  attr_accessible :content, :user_id, :grav_attributes

  has_many :grav, dependent: :destroy
  accepts_nested_attributes_for :grav, allow_destroy: true

  def grav
  	my_pic = grav.content
  end
end
