class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.integer :match_id
      t.integer :author_id
      t.string :body

      t.timestamps
    end
  end
end
