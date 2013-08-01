class AddLawyerIdToFilings < ActiveRecord::Migration
  def change
    add_column :filings, :lawyer_id, :integer
  end
end
