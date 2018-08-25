class Punchcard < ApplicationRecord
  belongs_to :user
  has_many :records, dependent: :destroy
  has_one :goal
  accepts_nested_attributes_for :goal

  validates :name, :presence => true


  def total_hours
    self.records.sum(:hours)
  end

  def current_month_hours
    self.records.where(date: Time.now.beginning_of_month..Time.now.end_of_month).sum(:hours)
  end

  def goal_completed?
    if self.goal.present?
      self.current_month_hours >= self.goal.monthly_hours
    else
      false
    end
  end

  def start_time
    if self.records.first.present?
      self.records.first.created_at.strftime('%B %d %Y')
    else
      self.created_at.strftime('%B %d %Y')
    end
  end

end
