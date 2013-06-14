class Messenger < ActiveRecord::Base

  is_private_message
  attr_accessible :to, :subject, :body
  # The :to accessor is used by the scaffolding,
  # uncomment it if using it or you can remove it if not
  attr_accessor :to
  
  def feed
    Conver.from_messengers_received_by(self)
  end

  default_scope order: 'messengers.created_at ASC'

  has_attached_file :message_attach
end