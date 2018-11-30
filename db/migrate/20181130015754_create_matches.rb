class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
      t.date :date
      t.time :start
      t.time :end
      t.integer :sender_availability_id
      t.integer :recipient_availability_id
      t.integer :state_id

      t.timestamps
    end
  end
end
