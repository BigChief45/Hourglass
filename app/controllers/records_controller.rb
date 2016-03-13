class RecordsController < ApplicationController
    before_action :authenticate_user!
    
    before_action :find_punchcard
    before_action :find_record, only: [:show, :edit, :update, :destroy]
    
    def index
        @records = @card.records
        hash = {}
        
        @records.each do |r|
            hash[r.date.to_i] = r.hours
        end
        
        respond_to do |format|
            format.json { render :json => hash }
            #format.json { render :json => @records.map { |model| {:timestamp => model.date.to_i, :value => 30 } } }
        end
    end
    
    def new
        @record = @card.records.build
    end
    
    def create
        @record = @card.records.build(record_params)
       
        respond_to do |format|
            if @record.save
                format.html { redirect_to punchcards_path, :flash => { :success => 'Record punched successfully.' } }
            else
                format.html { render 'new', :flash => { :danger => 'Error punching record.' } }
            end
        end
    end
    
    private
    
        def find_punchcard
            @card = Punchcard.find(params[:punchcard_id])
        end
        
        def find_record
            @record = Record.find(params[:id])
        end
        
        def record_params
           params.require(:record).permit(:date, :hours, :description, :punchcard_id) 
        end
end
