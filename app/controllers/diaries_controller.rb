class DiariesController < ApplicationController
  def index
    @diaries = Diary.all
  end

  def show
  end

  def edit
  end

  def new
  end
end
