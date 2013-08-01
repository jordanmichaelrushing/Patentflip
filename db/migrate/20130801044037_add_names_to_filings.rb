class AddNamesToFilings < ActiveRecord::Migration
  def change
    add_column :filings, :user_name, :string
    add_column :filings, :lawyer_name, :string
  end
end
