class AddCloseDateToJewelloans < ActiveRecord::Migration
  def change
    add_column :jewelloans, :close_date, :date
  end
end
