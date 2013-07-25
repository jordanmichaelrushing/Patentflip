class AddUserIdToFilings < ActiveRecord::Migration
  def change
    add_column :filings, :user_id, :integer
  end
end
