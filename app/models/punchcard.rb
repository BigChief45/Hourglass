class Punchcard < ActiveRecord::Base
    belongs_to :user
    has_many :records, dependent: :destroy
    
    validates :name, :presence => true
    
    def total_hours
       # Returns the total hours of all records for this card
       self.records.sum(:hours)
    end

end
