class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).page(params[:page]).per(5)
  end

  def show
    @diaries = @user.diaries.select(:id, :title, :created_at)
  end
end
