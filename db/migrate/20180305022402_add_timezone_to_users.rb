class AddTimezoneToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :time_zone, :string, default: 'UTC'
  end
end
