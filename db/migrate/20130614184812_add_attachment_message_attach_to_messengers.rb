class AddAttachmentMessageAttachToMessengers < ActiveRecord::Migration
  def self.up
    change_table :messengers do |t|
      t.attachment :message_attach
    end
  end

  def self.down
    drop_attached_file :messengers, :message_attach
  end
end
