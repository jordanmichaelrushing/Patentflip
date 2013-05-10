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


  has_attached_file :avatar, styles: { medium: "200x200>", thumb: "100x100>" }, default_url: "/assets/coolguy_:style.png", :storage => :s3,
     :s3_credentials => "#{Rails.root}/config/s3.yml",
     :path => "/:style/:id/:filename"

  has_secure_password 
  has_many :microposts, dependent: :destroy
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

  def feed
    # This is preliminary. See "Following users" for the full implementation.
    Micropost.where("user_id = ?", id)
  end 

  private
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end


end
