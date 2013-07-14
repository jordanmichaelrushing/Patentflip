class AddCategoryToUsers < ActiveRecord::Migration
  def change
    add_column :users, :pat_cat, :string
  end
end
