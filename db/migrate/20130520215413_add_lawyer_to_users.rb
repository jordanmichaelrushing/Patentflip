class AddLawyerToUsers < ActiveRecord::Migration
  def change
    add_column :users, :lawyer, :boolean, default: false
    add_column :users, :firm, :string
    add_column :users, :years_practicing, :integer
    add_column :users, :billable_hours, :integer
    add_column :users, :firm_site, :string
    add_column :users, :billable_rate, :integer
    add_column :users, :pat_bar_num, :integer
    add_column :users, :agent_or_lawyer, :boolean, default: false
  end
end
