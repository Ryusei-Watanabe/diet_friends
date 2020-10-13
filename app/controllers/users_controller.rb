class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
  end
  def show
  end
end
