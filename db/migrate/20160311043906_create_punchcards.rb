class CreatePunchcards < ActiveRecord::Migration[4.2]
  def change
    create_table :punchcards do |t|
      t.string :name
      t.string :description
      t.string :icon
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
