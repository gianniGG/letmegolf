class GroupsController < ApplicationController

  def index
    @groups = Group.all
  end

  def show
    @group = current_user.group
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new group_params

    #group attributes before save
    entered_admins = params[:group][:admins] ? Group.parse_admins(params[:group][:admins]) : nil
    admins_to_save = entered_admins ? Group.saved_admins(entered_admins) : current_user
    unsaved_admins = Group.invalid_admins(entered_admins)

    @group.users << admins_to_save
    @group.admins << admins_to_save

    admin_names = @group.admins.empty? ? nil : @group.admins.map(&:name)

    @group.points = @group.total_user_points

    if @group.save
      flash[:success] = "Group created. "
      flash[:success] << pretty_list(admin_names) + " granted administrative powers" if admin_names
      flash[:alert] = pretty_list(unsaved_admins) + " are not LMG members" if unsaved_admins
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

  private

    def group_params
      { name: params[:group][:name], leader: current_user.name, points: 0 }
    end
end
