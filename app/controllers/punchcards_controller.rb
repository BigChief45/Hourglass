class PunchcardsController < ApplicationController
  before_action :find_punchcard, only: [:show, :edit, :update, :destroy]

  def index
    @cards = current_user.punchcards.all.includes(:records).sort_by(&:total_hours).reverse
  end

  def new
    @card = current_user.punchcards.build
    @goal = @card.build_goal
  end

  def show
  end

  def create
   @card = current_user.punchcards.build(punchcard_params)

   respond_to do |format|
      if @card.save
        format.html { redirect_to punchcards_path, flash: { notice: 'Punchcard created successfully' } }
      else
        format.html { render 'new', flash: { danger: 'Error creating punchcard.' } }
      end
    end
  end

  def edit
    @goal = @card.build_goal if @card.goal.nil?
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
      @card = authorize Punchcard.find(params[:id])
    end

    def punchcard_params
      params.require(:punchcard).permit(:name, :description, :icon, :user_id, goal_attributes: [:id, :monthly_hours])
    end

end
