class Goal < ApplicationRecord
  belongs_to :punchcard

  validates :monthly_hours, :presence => true

end
