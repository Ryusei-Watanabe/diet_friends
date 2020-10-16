class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :destroy]
  def index
    @groups = current_user.groups
  end
  def show
  end
  def new
    @group = Group.new
    # assignのuser_idに登録される
  end
  def create
    @group = Group.new(group_params)
    @group.users << current_user
    if @group.save
      redirect_to groups_path, notice: 'グループを作成しました'
    else
      render :new
    end
  end
  def add_user_to_group
    @group.users << User.find(params[:id])
    Assign.create(user_id: params[:user_id], group_id: params[:group_id])
  end
  def destroy
    @group.destroy
    redirect_to groups_path, notice: "削除しました"
  end
  private
  def set_group
    @group = Group.find(params[:id])
  end
  def group_params
    params.require(:group).permit(:name, user_ids: [] )
  end
end