class CreateFilings < ActiveRecord::Migration
  def change
    create_table :filings do |t|
      t.string :milestone_title
      t.text :milestone_content
      t.boolean :milestone_success
      t.boolean :milestone_on_time
      t.boolean :milestone_late
      t.integer :milestone_timer
      t.boolean :minestone_user_accept
      t.boolean :user_accept_filing
      t.integer :pay_per_milestone
      t.string :filing_title
      t.text :filing_content
      t.integer :user_current_filing_amount
      t.integer :user_success_filing
      t.string :filing_user_name
      t.string :filing_lawyer_name
      t.string :job_category
      t.string :job_descrip
    end
  end
end
