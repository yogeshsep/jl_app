class CreateJewelloans < ActiveRecord::Migration
  def change
    create_table :jewelloans do |t|
      t.integer :account_number
      t.string :customer_name
      t.text :customer_address
      t.float :amount
      t.float :interest_rate
      t.date :opened_on
      t.date :due_date
      t.float :amount_due
      t.text :jewel
      t.integer :no_of_items
      t.float :gross_weight
      t.float :net_weight
      t.float :appraised_amount
      t.float :loan_amount

      t.timestamps null: false
    end
  end
end
