class DiariesController < ApplicationController
  def index
    @diaries = Diary.all
  end
  def new
    @diary = Diary.new
  end
  def create
    @diary = current_user.diaries.build(diary_params)
    if params[:back]
      format.html{render :new}
    else
      if @diary.save
        redirect_to diaries_path, notice: 'Post was successfully created.'
      else
        render
      end
    end
  end
  def show
  end

  def edit
  end
  private
  def set_diary
    @diary = Diary.find(params[:id])
  end
  def diary_params
    params.require(:diary).permit(:title, :body_weight, :study)
  end
end
