class CreateStaticPages < ActiveRecord::Migration
  def change
    create_table :static_pages do |t|
      t.string :content
      t.integer :user_id
    end
  end
end
