class Group < ActiveRecord::Base

  attr_accessible :group_name, :group_id
  has_many :memberships
  has_many :users, through: :memberships
end 