class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  respond_to? :js
  def index
    @users = current_user.followeds & current_user.followers
    @followeds = current_user.followeds
    @followers = current_user.followers
  end
  def create
    if logged_in?
      @user = User.find(params[:relationship][:followed_id])
      current_user.follow!(@user)
    end
  end
  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user)
  end
end
