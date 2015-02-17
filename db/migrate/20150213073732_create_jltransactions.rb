class CreateJltransactions < ActiveRecord::Migration
  def change
    create_table :jltransactions do |t|
      t.date :transaction_date
      t.float :transaction_amount
      t.string :transaction_mode
      t.string :transaction_type
      t.string :particulars
      t.string :comments

      t.timestamps null: false
    end
  end
end
