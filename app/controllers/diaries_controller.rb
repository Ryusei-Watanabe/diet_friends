class DiariesController < ApplicationController
  before_action :set_diary, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :whose_diary?, only: [:edit, :destroy]
  def index
    @diaries = current_user.diaries.order(created_at: :desc)
  end
  def new
    @diary = Diary.new
  end
  def create
    @diary = current_user.diaries.build(diary_params)
    @diary.create_date = Date.today
    if params[:back]
      render :new, notice: 'Diary was successfully created.'
    else
      if @diary.save
        redirect_to diaries_path, notice: 'Diary was successfully edited.'
      else
        render :edit, notice: 'Diary was not successfully edited.'
      end
    end
  end
  def show
  end
  def edit
  end
  def update
    if @diary.update(diary_params)
      redirect_to diaries_path, notice: 'EditDiary'
    else
      render :edit, notice: 'EditDiary'
    end
  end
  def destroy
    @diary.destroy
    redirect_to diaries_path, notice: 'Diary was successfully destroyed.'
  end
  private
  def set_diary
    @diary = Diary.find(params[:id])
  end
  def diary_params
    params.require(:diary).permit(:title, :body_weight, :study)
  end
  def whose_diary?
    if @diary.user != current_user
      redirect_to diary_path
    end
  end
end
