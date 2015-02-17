class Jewelloan < ActiveRecord::Migration
  def change
  	add_column :jewelloans, :transaction_mode, :string
  	add_column :jewelloans, :transaction_type, :string
  	add_column :jewelloans, :particulars, :string
  	add_column :jewelloans, :comments, :string
  end
end
