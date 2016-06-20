class RecordsController < ApplicationController
    before_action :authenticate_user!
    
    before_action :find_punchcard, except: [:search_record]
    before_action :find_record, only: [:show, :edit, :update, :destroy]
    
    def index
        # Ransack Search
        @q = Record.ransack(params[:q])
        @records = @q.result(distinct: true).order("created_at DESC")
        
        # Pagination
        @records = @records.paginate(:page => params[:page], :per_page => 10)
        
        # JSON Record data For Cal Heat Map
        @json_records = @card.records
        
        # We need to convert the available @records data into the corresponding
        # data format for Cal-heatmap, which is:
        #
        # {
        # 	"timestamp": value,
        # 	"timestamp2": value2,
        # 	...
        # }
        hash = {}
        @json_records.each do |r|
            hash[r.date.to_i] = r.hours
        end
        
        respond_to do |format|
            # Return the hash with the correct format
            format.json { render :json => hash }
            format.html
        end
    end
    
    def new
        @record = @card.records.build
    end
    
    def show
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
    
    def edit
    end
    
    def update
        respond_to do |format|
            if @record.update(record_params)
                format.html { redirect_to [@card, @record], notice: 'Record was successfully updated.' }
            else
                format.html { render :edit }
            end
        end
    end
    
    def destroy
        @record.destroy
        respond_to do |format|
            format.html { redirect_to punchcards_path, notice: 'Record was successfully deleted.' }
        end
    end
    
    def search_record
        # Searches for a record using its date attribute and punchcard.
        # Used with AJAX calls within CalHeatMap events
        record = Record.find_by(date: params[:record_date], punchcard_id: params[:pcard_id])
       
        respond_to do |format|
            format.json { render json: record.id }
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
