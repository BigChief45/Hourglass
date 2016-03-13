class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.timestamp :date
      t.integer :punchcard_id
      t.text :description

      t.timestamps null: false
    end
  end
end
