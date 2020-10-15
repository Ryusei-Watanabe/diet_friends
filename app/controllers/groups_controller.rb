class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :destroy]
  def index
    # @groups = Group.find(params[:group_id])
    @groups = Group.all
  end
  def show
  end
  def new
    @group = Group.new
    # assignのuser_idに登録される
    @group.users << current_user
  end
  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to groups_path, notice: 'グループを作成しました'
    else
      render :new
    end
  end
  def add_user_to_group

  end
  def destroy
    @group.destroy
  end
  private
  def set_group
    @group = Group.find(params[:id])
  end
  def group_params
    params.require(:group).permit(:name, user_ids: [] )
  end
end