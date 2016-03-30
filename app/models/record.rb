class Record < ActiveRecord::Base
    belongs_to :punchcard
    
    validates :date, :presence => true
    validates :date, :uniqueness => { scope: :punchcard_id }
    
    validates :hours, :presence => true
    validates :description, :presence => true
    
end
