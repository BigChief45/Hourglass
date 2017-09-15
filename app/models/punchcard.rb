class Punchcard < ActiveRecord::Base
  belongs_to :user
  has_many :records, dependent: :destroy

  validates :name, :presence => true

  def total_hours
     self.records.sum(:hours)
  end

  def start_time
    unless self.records.empty?
      self.records.first.created_at.strftime("%B %d %Y")
    else
      self.created_at.strftime("%B %d %Y")
    end
  end

end
