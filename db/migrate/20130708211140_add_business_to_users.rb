class AddBusinessToUsers < ActiveRecord::Migration
  def change
    add_column :users, :business, :boolean, deafult: false
    add_column :users, :biz, :string
    add_column :users, :biz_site, :string
    add_column :users, :biz_position, :string
    add_column :users, :hidden, :boolean, deafult: false
  end
end
