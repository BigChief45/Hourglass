class AddHoursToRecords < ActiveRecord::Migration
  def change
    add_column :records, :hours, :integer
  end
end
