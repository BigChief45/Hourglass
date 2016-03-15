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
        @records = @card.records.all.order("created_at DESC").limit(5)
        
        # Records Pagination
        #@records = @records.paginate(:page => params[:page], :per_page => 1)
        
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
    
    def edit
    end
    
    def update
        respond_to do |format|
            if @card.update(punchcard_params)
                format.html { redirect_to punchcards_path, notice: 'Punchcard was successfully updated.' }
            else
                format.html { render :edit }
            end
        end
    end
    
    def destroy
        @card.destroy
        respond_to do |format|
            format.html { redirect_to punchcards_path, notice: 'Punchcard was successfully deleted.' }
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
