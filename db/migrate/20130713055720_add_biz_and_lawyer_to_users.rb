class AddBizAndLawyerToUsers < ActiveRecord::Migration
  def change
    add_column :users, :biz_law, :string, default: "user"
  end
end
