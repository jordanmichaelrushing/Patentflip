class AddGroupIdToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :group_ip, :integer
  end
end
