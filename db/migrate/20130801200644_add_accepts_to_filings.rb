class AddAcceptsToFilings < ActiveRecord::Migration
  def change
    add_column :filings, :user_accept, :boolean, default: false
    add_column :filings, :lawyer_accept, :boolean, default: false
  end
end
