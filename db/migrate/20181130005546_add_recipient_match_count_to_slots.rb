class AddRecipientMatchCountToSlots < ActiveRecord::Migration[5.1]
  def change
    add_column :slots, :recipient_matches_count, :integer
  end
end
