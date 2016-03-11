class Punchcard < ActiveRecord::Base
    belongs_to :user
    
    validates :name, :presence => true
    validates :icon, :presence => true
end
