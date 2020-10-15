class GroupsController < ApplicationController
  def new
    @group = Group.new
    @group.users = current_user.id
  end
  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path, notice: 'グループを作成しました'
    else
      render :new
    end
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