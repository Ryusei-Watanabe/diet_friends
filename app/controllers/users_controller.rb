class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :authenticate_user!
  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct:true).where.not(id: current_user.id)
  end
  def show
    @diaries = @user.diaries.select(:id, :title, :created_at).order(created_at: :desc)
    @chart = Diary.pluck(:body_weight, :created_at)
  end
end
