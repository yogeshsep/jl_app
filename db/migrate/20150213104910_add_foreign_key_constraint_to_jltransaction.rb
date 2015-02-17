class AddForeignKeyConstraintToJltransaction < ActiveRecord::Migration
  def change
    add_column :jltransactions, :jewelloan_id, :integer
  end
end
