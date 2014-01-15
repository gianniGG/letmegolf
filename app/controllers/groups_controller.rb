class GroupsController < ApplicationController
  skip_before_action :index

  def index
    @groups = Group.all
  end

  def show
    @group = Group.find_by_id(current_user.group_id)
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new group_params
    @group.users += Group.parse_admins params[:group][:admins] if Group.parse_admins params[:group][:admins]

    @group.users << current_user
    @group.users.uniq!
    @group.points = @group.total_user_points

    if @group.save
      flash[:success] = "Group created."
      redirect_to @group
    else
      render 'new'
    end

  end

  def destroy
    Group.find_by_id(current_user.group_id).destroy
  end

  def edit
    @group = Group.find_by_id(current_user.group_id)
  end

  def update
  end

  def check_groupname
    groupname_is_free = Group.find_by_name(params[:name]).nil?
    render json: {free: groupname_is_free}.to_json
  end

  def admins
    Group.parse_admins params[:admins]
  end

  private

    def group_params
      { name: params[:group][:name], admins: admins, leader: current_user.name, points: 0 }
    end
end
