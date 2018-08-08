class RecordsController < ApplicationController
    before_action :authenticate_user!

    before_action :find_punchcard, except: [:search, :today]
    before_action :find_record, only: [:show, :edit, :update, :destroy]

    def index
      # Ransack Search
      @q = @card.records.ransack(params[:q])
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
          hash[r.date.to_time.to_i] = r.hours.to_f
      end

      respond_to do |format|
        # Return the hash with the correct format
        format.json { render :json => hash }
        format.html
      end
    end

    def new
      @record = @card.records.build(hours: 1)
    end

    def show
    end

    def create
      @record = @card.records.build(record_params)

      respond_to do |format|
        if @record.save
          format.html { redirect_to root_path, flash: { notice: 'Entry created successfully.' } }
        else
          format.js
          format.html { render :new, flash: { danger: 'Error creating entry.' } }
        end
      end
    end

    def edit
    end

    def update
      respond_to do |format|
        if @record.update(record_params)
          format.html { redirect_to root_path, notice: 'Record was successfully updated.' }
        else
          format.js
          format.html { render :edit, flash: { danger: 'Error trying to update record. '} }
        end
      end
    end

    def destroy
      @record.destroy
      respond_to do |format|
        format.html { redirect_to punchcards_path, notice: 'Record was successfully deleted.' }
      end
    end

    def search
      # Searches for a record using its date attribute and punchcard.
      # Used with AJAX calls within a CalHeatMap
      record = Record.find_by(date: params[:record_date],
        punchcard_id: params[:punchcard_id])

      respond_to do |format|
        format.json { render json: record.id }
      end
    end

    def today
      @todays_records = Record.where('date >= ?', DateTime.now.in_time_zone(current_user.time_zone).to_date.strftime('%Y-%m-%d'))
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
