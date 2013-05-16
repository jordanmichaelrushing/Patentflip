class CreateConvers < ActiveRecord::Migration
  def change
    create_table :convers do |t|
      t.integer :sender_id
      t.integer :receiver_id

      t.timestamps
    end

    add_index :convers, :sender_id
    add_index :convers, :receiver_id
    add_index :convers, [:sender_id, :receiver_id], unique: true
  end
end
