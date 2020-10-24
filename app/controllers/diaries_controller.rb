class DiariesController < ApplicationController
  before_action :set_diary, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :whose_diary?, only: [:edit, :destroy]
  before_action :authenticate_user!
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
      render :new
    else
      if @diary.save
        redirect_to diaries_path, notice: t("views.controller.CreateDiary")
      else
        render :new, notice: t("views.controller.DontCreateDiary")
      end
    end
  end
  def show
  end
  def edit
  end
  def update
    if @diary.update(diary_params)
      redirect_to diaries_path, notice: t('views.controller.EditDiary')
    else
      render :edit, notice: t('views.controller.DontEditDiary')
    end
  end
  def destroy
    @diary.destroy
    redirect_to diaries_path, notice: t('views.controller.DiaryWasSuccessfullyDestroyed')
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
