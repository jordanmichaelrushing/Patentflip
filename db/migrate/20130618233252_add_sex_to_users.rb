class AddSexToUsers < ActiveRecord::Migration
  def change
    add_column :users, :sex, :string, default: "undefined"
  end
end
