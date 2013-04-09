class CreateGravs < ActiveRecord::Migration
  def change
    create_table :gravs do |t|
      t.string :content
      t.integer :user_id
    end
  end
end
