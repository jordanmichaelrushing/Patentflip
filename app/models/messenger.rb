class Messenger < ActiveRecord::Base

  is_private_message
  attr_accessible :to, :subject, :body, :message_attach
  # The :to accessor is used by the scaffolding,
  # uncomment it if using it or you can remove it if not
  attr_accessor :to
  
  def feed
    Conver.from_messengers_received_by(self)
  end

  default_scope order: 'messengers.created_at ASC'

  has_attached_file :message_attach
  validates_attachment :message_attach, content_type: { content_type: "application/pdf", content_type: "image/png", content_type: "image/jpeg", content_type: "image/gif", content_type: "image/bmp", content_type: "image/jpg", message: "You can only send photos (.jpeg, .jpg, .bmp, .gif, .png) and PDF files" }
end