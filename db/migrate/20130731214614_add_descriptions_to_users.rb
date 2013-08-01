class AddDescriptionsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :biz_descrip, :text
    add_column :users, :firm_descrip, :text
    add_column :users, :user_descrip, :text
    add_column :users, :biz_or_person, :boolean
  end
end
