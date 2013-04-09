class CreateGravs < ActiveRecord::Migration
  def change
    create_table :gravs do |t|
      t.string :content, default: 'assets/coolguy.png'
      t.integer :user_id
    end
  end
end
