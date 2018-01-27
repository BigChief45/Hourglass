class AddHoursToRecords < ActiveRecord::Migration[4.2]
  def change
    add_column :records, :hours, :integer
  end
end
