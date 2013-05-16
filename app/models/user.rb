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
  :user_attributes, :avatar_file_name

  has_attached_file :avatar, styles: { medium: "200x200>", thumb: "100x100>",
   micro: "60x60>" }, default_url: "/assets/coolguy_:style.png"

  has_many :auctions, dependent: :destroy
  accepts_nested_attributes_for :auctions
  has_many :microposts, dependent: :destroy
  has_private_messages class_name: "Messenger"
  accepts_nested_attributes_for :microposts

  has_secure_password 
	before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  validates_attachment :avatar, :size => { :in => 0..1000.kilobytes }
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
  has_many :senders, through: :reverse_convers, source: :sender
  has_many :convers, foreign_key: "sender_id", dependent: :destroy
  has_many :receiver_users, through: :convers, source: :receiver
  has_many :receivers, through: :convers, source: :receiver


  def receiving?(other_user)
      convers.find_by_receiver_id(other_user.id)
    end

  def receive!(other_user)
      convers.create!(receiver_id: other_user.id)
    end

  def del_receiving!(other_user)
      convers.find_by_receiver_id(other_user.id).destroy
    end

  def sending?(other_user)
      convers.find_by_sender_id(other_user.id)
    end

  def send!(other_user)
      convers.create!(sender_id: other_user.id)
    end

  def del_sending!(other_user)
      convers.find_by_sender_id(other_user.id).destroy
    end


  def feed
    # This is preliminary. See "Following users" for the full implementation.
    Micropost.where("user_id = ?", id)
  end 

  private
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end


end
