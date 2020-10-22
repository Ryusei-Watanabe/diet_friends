class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  before_action :set_friends, only: [:new,:create, :edit,:update, :show]
  def index
    @groups = current_user.groups
  end
  def show
  end
  def new
    @group = Group.new
  end
  def create
    @group = Group.new(group_params)
    @group.users << current_user
    # assignsのuser_idに登録される
    if @group.save
      redirect_to groups_path, notice: 'グループを作成しました'
    else
      render :new
    end
  end
  def edit
  end
  def update
    if @group.update(group_params)
      # 自分のpramsを渡せていないので必要。後々改善したい。
      @group.users << current_user
      redirect_to groups_path, notice: t(".EditGroup")
    else
      render :edit
    end
  end
  def destroy
    @group.assigns.find_by(user_id: current_user.id).destroy
    if @group.assigns.present?
      redirect_to groups_path, notice: "グループを脱退しました"
    else
      @group.destroy
      redirect_to groups_path, notice: "グループを削除しました"
    end

  end
  private
  def set_group
    @group = Group.find(params[:id])
  end
  def set_friends
    @users = current_user.followeds & current_user.followers
  end
  def group_params
    params.require(:group).permit(:name, {user_ids: []})
  end
end
