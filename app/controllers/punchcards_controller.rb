class PunchcardsController < ApplicationController
    
    before_action :authenticate_user!
    before_action :find_punchcard, only: [:show, :edit, :update, :destroy]
    
    def index
       @cards = current_user.punchcards.all 
    end
    
    def new
        @card = current_user.punchcards.build
    end
    
    def show
        respond_to do |format|
            format.js
        end
    end
    
    def create
       @card = current_user.punchcards.build(punchcard_params)
       
       respond_to do |format|
            if @card.save
                format.html { redirect_to punchcards_path, :flash => { :success => 'Punchcard created successfully.' } }
            else
                format.html { render 'new', :flash => { :danger => 'Error creating punchcard.' } }
            end
        end
    end
    
    private
    
        def find_punchcard
            @card = Punchcard.find(params[:id])
        end
        
        def punchcard_params
            params.require(:punchcard).permit(:name, :description, :icon, :user_id)
        end
    
end
