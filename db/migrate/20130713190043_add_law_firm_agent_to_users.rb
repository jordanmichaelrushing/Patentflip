class AddLawFirmAgentToUsers < ActiveRecord::Migration
  def change
    add_column :users, :firm_agent_lawyer, :string, default: "lawyer"
  end
end
