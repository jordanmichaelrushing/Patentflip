class AddSpecsToMilestones < ActiveRecord::Migration
  def change
    add_column :milestones, :milestone_title, :string
    add_column :milestones, :milestone_content, :text
    add_column :milestones, :milestone_success, :boolean
    add_column :milestones, :milestone_on_time, :boolean
    add_column :milestones, :milestone_late, :boolean
    add_column :milestones, :milestone_timer, :integer
    add_column :milestones, :milestone_user_accept, :boolean
  end
end
