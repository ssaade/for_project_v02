class AddSentMatchCountToSlots < ActiveRecord::Migration[5.1]
  def change
    add_column :slots, :sent_matches_count, :integer
  end
end
