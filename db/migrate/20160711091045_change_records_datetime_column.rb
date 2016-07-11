class ChangeRecordsDatetimeColumn < ActiveRecord::Migration
  def change
    change_column :records, :date, :date
  end
end
