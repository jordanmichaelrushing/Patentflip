class AddCreditCardToUsers < ActiveRecord::Migration
  def change
    add_column :users, :card_num, :integer
    add_column :users, :exp_month, :integer
    add_column :users, :exp_year, :integer
    add_column :users, :verify_code, :integer
    add_column :users, :card_first_name, :string
    add_column :users, :card_last_name, :string
    add_column :users, :charge_amount_dollar, :integer
    add_column :users, :charge_amount_cents, :integer
    add_column :users, :card_type, :string
    add_column :users, :my_fee_dollars, :integer
    add_column :users, :my_fee_cents, :integer
    add_column :users, :ip_address, :string
    add_column :users, :charge_amount_total, :integer
    add_column :users, :my_fee_total, :integer
    add_column :users, :card_address, :string
    add_column :users, :card_city, :string
    add_column :users, :card_state, :string
    add_column :users, :card_country, :string
    add_column :users, :card_zip, :integer
    add_column :users, :trans_id, :string

    add_column :users, :usr_name, :string

  end
end
