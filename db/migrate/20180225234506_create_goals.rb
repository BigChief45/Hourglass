class CreateGoals < ActiveRecord::Migration[5.1]
  def change
    create_table :goals do |t|
      t.decimal :monthly_hours, precision: 4, scale: 2
      t.integer :punchcard_id

      t.timestamps
    end
  end
end
