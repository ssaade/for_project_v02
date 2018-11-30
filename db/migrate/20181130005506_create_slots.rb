class CreateSlots < ActiveRecord::Migration[5.1]
  def change
    create_table :slots do |t|
      t.integer :user_id
      t.date :date
      t.time :start
      t.time :end

      t.timestamps
    end
  end
end
