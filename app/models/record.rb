class Record < ActiveRecord::Base
    belongs_to :punchcard
    
    validates :date, :presence => true
    validates :description, :presence => true
    
end
