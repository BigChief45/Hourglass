class ChangeRecordsDatetimeColumn < ActiveRecord::Migration[4.2]
  def change
    change_column :records, :date, :date
  end
end
