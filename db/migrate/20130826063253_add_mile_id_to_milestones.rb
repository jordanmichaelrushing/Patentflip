class AddMileIdToMilestones < ActiveRecord::Migration
  def change
    add_column :milestones, :mile_id, :string
  end
end
