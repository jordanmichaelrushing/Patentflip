class Conver < ActiveRecord::Base
  attr_accessible :receiver_id, :sender_id

belongs_to :sender, class_name: "User"
belongs_to :receiver, class_name: "User"

validates :sender_id, presence: true
validates :receiver_id, presence: true

  def self.from_messengers_received_by(messenger)
    received_messenger_ids = "SELECT receiver_id FROM convers
                              WHERE receiver_id = :messenger_id"
    where("messenger_id IN (#{received_messenger_ids}) OR messenger_id = :messenger_id",
           messenger_id: messenger.id)
  end  
end
