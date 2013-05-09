class CreateAuctions < ActiveRecord::Migration
  def change
    create_table :auctions do |t|
      t.string :descrip
      t.string :title
      t.string :category
      t.string :img_url
      t.string :pat_num
      t.decimal :cost
      t.integer :timer_hr
      t.string :timer_min
      t.string :integer
      t.integer :timer_day
      t.string :pat_type
      t.string :lic_or_sell
      t.text :pat_off_desc
      t.integer :user_id

      t.timestamps
    end
  end
end
