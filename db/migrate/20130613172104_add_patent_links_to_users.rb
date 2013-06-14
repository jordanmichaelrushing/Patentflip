class AddPatentLinksToUsers < ActiveRecord::Migration
  def change
    add_column :users, :pat_buy, :integer, default: 0
    add_column :users, :pat_sold, :integer, default: 0
    add_column :users, :pat_selling, :integer, default: 0
  end
end
