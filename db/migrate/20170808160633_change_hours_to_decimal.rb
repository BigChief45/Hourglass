class ChangeHoursToDecimal < ActiveRecord::Migration[4.2]
  def change
    change_column :records, :hours, :decimal, precision: 4, scale: 2
  end
end
