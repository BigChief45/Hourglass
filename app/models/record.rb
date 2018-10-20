class Record < ApplicationRecord
  belongs_to :punchcard, touch: true

  validates :date, :presence => true
  validates :date, :uniqueness => { scope: :punchcard_id }

  validates :hours, :presence => true
  validates :description, :presence => true


  def next
    self.class.where('id > ? AND punchcard_id = ?', id, self.punchcard_id).first
  end

  def previous
    self.class.where('id < ? AND punchcard_id = ?', id, self.punchcard_id).last
  end
end
