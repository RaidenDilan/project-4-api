class HolidaysController < ApplicationController
  before_action :set_holiday, only: [:show, :update, :destroy]
  # before_action :get_group, only: [:show, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show] # for any page except for index and show pages

  # GET /holidays
  def index
    @holidays = Holiday.all
    # @groups = @groups.holidays

    render json: @holidays
  end

  # GET /holidays/1
  def show
    @comments = Comment.where('comment_id = ?', params[:comment_id])

    render json: @holiday
  end

  # def new
  #   @groups = @groups.holidays.build
  # end

  # POST /holidays
  def create
    @holiday = Holiday.new(Uploader.upload(holiday_params))
    @holiday.user = current_user

    if @holiday.save
      render json: @holiday, status: :created, location: @holiday
    else
      render json: @holiday.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /holidays/1
  def update
    return render json: { errors: ["Unauthorized"] } if @holiday.user != current_user # if user is not logged in then don't let them access and edit the holidays in INSOMNIA. so don't return the rest of the mehtod unless logged in.

    if @holiday.update(Uploader.upload(holiday_params))
      render json: @holiday
    else
      render json: @holiday.errors, status: :unprocessable_entity
    end
  end

  # DELETE /holidays/1
  def destroy
    return render json: { errors: ["Unauthorized"] } if @holiday.user != current_user # if user is not logged in then don't let them access and edit the holidays in INSOMNIA. so don't return the rest of the mehtod unless logged in.

    @holiday.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_holiday
      @holiday = Holiday.find(params[:id])
    end

    # def get_group
    #   @group = Group.find(params[:group_id])
    # end

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
