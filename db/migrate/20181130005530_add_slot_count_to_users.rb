class AddSlotCountToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :slots_count, :integer
  end
end
