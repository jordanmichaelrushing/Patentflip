class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.string :users

      t.timestamps
    end
  end
end
