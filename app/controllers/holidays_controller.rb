class HolidaysController < ApplicationController
  before_action :set_holiday, only: [:show, :update, :destroy]
  before_action :get_group, only: [:create, :destroy]
  skip_before_action :authenticate_user!

  # GET /holidays
  def index
    @holidays = Holiday.all
    render json: @holidays
  end

  # GET /holidays/1
  def show
    @comments = Comment.where('comment_id = ?', params[:comment_id])
    render json: @holiday
  end

  # POST /holidays
  def create
    @holiday = @group.holidays.new(Uploader.upload(holiday_params))
    @holiday.user = current_user

    if @holiday.save
      render json: @holiday, status: :created
    else
      render json: @holiday.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /holidays/1
  def update
    return render json: { errors: ["Unauthorized"] } if @holiday.user != current_user

    if @holiday.update(Uploader.upload(holiday_params))
      render json: @holiday
      # render json: @holiday, status: :ok, location: @holiday
    else
      render json: @holiday.errors, status: :unprocessable_entity
    end

  end

  # DELETE /holidays/1
  def destroy
    return render json: { errors: ["Unauthorized"] } if @holiday.user != current_user
    @holiday.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_holiday
      @holiday = Holiday.find(params[:id])
    end

    def get_group
      @group = Group.find(params[:group_id])
    end

    # Only allow a trusted parameter "white list" through.
    def holiday_params
      params.require(:holiday).permit(
        :base64,
        :location,
        :attractions,
        :when_to_go,
        :departureDate,
        :returnDate,
        :departureAirport,
        :arrivalAirport,
        :user_id,
        :group_id
      )
    end
end
