class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show] # for any page except for index and show pages, ...

  # GET /groups
  def index
    @groups = Group.all

    @holidays = Holiday.where('holiday_id = ?', params[:holiday_id])
    # @users = User.where('user_id = ?', params[:user_id])

    render json: @groups
  end

  # GET /groups/1
  def show
    render json: @group
  end

  # POST /groups
  def create
    @group = Group.new(group_params)
    # before we save the new group into our databse we will attach the current user tot the new group.
    @group.creator = current_user

    if @group.save
      render json: @group, status: :created, location: @group
    else
      render json: @group.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /groups/1
  def update
    # if user is not logged in then don't let them access and edit the groups in INSOMNIA
    return render json: { errors: ["Unauthorized"] } if @group.creator != current_user
    @group.creator = current_user

    # @group.users << @user unless @group.users.include? @user
    # @membership = current_user.memberships.find(params[:id])

    if @group.update(group_params)
      render json: @group
    else
      render json: @group.errors, status: :unprocessable_entity
    end
  end

  # DELETE /groups/1
  def destroy
    return render json: { errors: ["Unauthorized"] } if @group.creator != current_user
    @group.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def group_params
      params.require(:group).permit(
        :name,
        :holiday_id,
        :memberships,
        :user_id,
        attendee_ids:[]
      )
    end
end
