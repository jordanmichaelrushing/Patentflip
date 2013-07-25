class AddSlugToFilings < ActiveRecord::Migration
  def change
    add_column :filings, :slug, :string
    add_index :filings, :slug, unique: true
  end
end
