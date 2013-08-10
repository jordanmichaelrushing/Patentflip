class AddFilingIdToMilestones < ActiveRecord::Migration
  def change
    add_column :milestones, :filing_id, :integer
  end
end
