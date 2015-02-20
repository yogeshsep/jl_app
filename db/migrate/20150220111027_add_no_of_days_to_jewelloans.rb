class AddNoOfDaysToJewelloans < ActiveRecord::Migration
  def change
    add_column :jewelloans, :no_of_days, :integer
  end
end
