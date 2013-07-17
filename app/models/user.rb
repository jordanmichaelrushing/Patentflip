class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation, :avatar, 
  :user_attributes, :avatar_file_name, :lawyer, :firm, :years_practicing, :listing_attributes,
  :billable_hours, :firm_site, :pat_bar_num, :agent_or_lawyer, :sex, :firm_agent_lawyer, :pat_cat

  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]

  def purchase
    response = GATEWAY.purchase(charge_amount_total, credit_card, purchase_options)
    transactions.create!(:action => "purchase", :amount => charge_amount_total, :response => response)
    response.success?
  end

  def charge_amount_total
    charge_amount_total = (charge_amount_dollars * 100) + charge_amount_cents
  end

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      all
    end
  end
  

  has_attached_file :avatar, styles: { medium: "200x200>", thumb: "100x100>",
   micro: "80x80>" }, default_url: "/assets/coolguy_:style.png"

  has_many :listings, dependent: :destroy
  accepts_nested_attributes_for :listings

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

    def purchase_options
    {
      :ip => request.remote_ip,
      :billing_address => {
        :name     => "#{card_first_name} #{card_last_name}",
        :address1 => "#{card_address}",
        :city     => "#{card_city}",
        :state    => "#{card_state}",
        :country  => "#{card_country}",
        :zip      => "#{card_zip}"
      }
    }
  end
  
  def validate_card
    unless credit_card.valid?
      credit_card.errors.full_messages.each do |message|
        errors.add_to_base message
      end
    end
  end

  def credit_card
    @credit_card ||= ActiveMerchant::Billing::CreditCard.new(
      :type               => "#{card_type}",
      :number             => "#{card_num}",
      :verification_value => "#{verify_code}",
      :month              => "#{exp_month}",
      :year               => "#{exp_year}",
      :first_name         => "#{card_first_name}",
      :last_name          => "#{card_last_name}"
    )
  end
end