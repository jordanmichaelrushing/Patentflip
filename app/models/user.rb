# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation, :avatar, 
  :user_attributes, :avatar_file_name, :lawyer

  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]
  # def should_generate_new_friendly_id?
  #   new_record?
  # end

  has_attached_file :avatar, styles: { medium: "200x200>", thumb: "100x100>",
   micro: "80x80>" }, default_url: "/assets/coolguy_:style.png"

  has_many :auctions, dependent: :destroy
  accepts_nested_attributes_for :auctions

  has_many :microposts, dependent: :destroy
  accepts_nested_attributes_for :microposts

  has_private_messages class_name: "Messenger"

  has_secure_password 
	before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  validates :name, presence: true, 
                   length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, 
  									format: { with: VALID_EMAIL_REGEX },
  	 								uniqueness: { case_sensative: false }
  
  validates :password, length: { minimum: 6 }
	validates :password_confirmation, presence: true

  has_many :reverse_convers, foreign_key: "receiver_id",
                                   class_name:  "Conver",
                                   dependent:   :destroy
  has_many :reverse_relationships, foreign_key: "followed_id",
                                  class_name: "Relationship",
                                  dependent: :destroy

  has_many :followers, through: :reverse_relationships, source: :follower
  has_many :senders, through: :reverse_convers, source: :sender

  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :convers, foreign_key: "receiver_id", dependent: :destroy


  has_many :followed_users, through: :relationships, source: :followed
  has_many :receiver_users, through: :convers, source: :receiver


  def following?(other_user)
    relationships.find_by_followed_id(other_user.id)
  end
  
  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by_followed_id(other_user.id).destroy
  end

  def receiving?(other_user)
      convers.find_by_receiver_id(other_user.id)
  end

  def receive!(other_user)
      convers.create!(receiver_id: other_user.id)
  end

  def del_receiving!(other_user)
      convers.find_by_receiver_id(other_user.id).destroy
  end


  def feed
    Micropost.from_users_followed_by(self)
  end

  private
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end