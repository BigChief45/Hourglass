class PunchcardsController < ApplicationController
    
    before_action :authenticate_user!
    before_action :find_punchcard, only: [:show, :edit, :update, :destroy]
    
    def new
        @card = Punchcard.new
    end
    
    private
    
        def find_punchcard
        end
    
end
