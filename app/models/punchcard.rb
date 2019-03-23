class Punchcard < ApplicationRecord
  belongs_to :user
  has_many :records, dependent: :destroy
  has_one :goal
  accepts_nested_attributes_for :goal

  validates :name, :presence => true


  def total_hours
    self.records.sum(:hours)
  end

  def current_month_records
    self.records.where(date: Time.now.beginning_of_month..Time.now.end_of_month)
  end

  def current_week_records
    self.records.where(date: Time.now.beginning_of_week..Time.now.end_of_week)
  end

  def previous_week_hours
    self.records.where(date: 2.weeks.ago..1.week.ago).sum(:hours)
  end

  def current_week_hours
    current_week_records.sum(:hours)
  end

  def previous_month_hours
    self.records.where(date: 1.month.ago).sum(:hours)
  end

  def current_month_hours
    current_month_records.sum(:hours)
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

  def yearly_progress
    JSON.dump(
      (self.created_at.year..Time.current.year).map do |year|
        year_hours = self.records.where('extract(year  from date) = ?', year).sum(:hours)
        {year: year, hours: year_hours}
      end
    )
  end

end
