class AddUserMessengerIdToMessengers < ActiveRecord::Migration
  def change
    add_column :messengers, :user_messenger_id, :integer
  end
end
