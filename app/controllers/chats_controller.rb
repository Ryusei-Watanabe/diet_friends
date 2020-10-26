class ChatsController < ApplicationController
  before_action :set_group, only: [:index, :create,:destroy]
  before_action :set_chat, only: [:destroy]
  before_action :authenticate_user!
  before_action :assigned_user!, only: [:index]
  def index
    @chat = Chat.new
    @chats = @group.chats.includes(:user).order( created_at: :desc)
  end
  def create
    @chat = @group.chats.new(chat_params)
    if @chat.save
      redirect_to group_chats_path(@group)
    else
      @chats = @group.chats.includes(:user)
      # flash.now[:alert] = 'メッセージを入力してください。'
      render :index
    end
  end
  def destroy
    if @chat.user == current_user
      @chat.destroy
      redirect_to group_chats_path, notice: 'チャットを削除しました'
    end
  end
  private
  def assigned_user!
    if @group.users.exclude?(current_user)
      flash[:notice] = "あなたが所属しているグループではありません"
      redirect_to groups_path
    end
  end
  def set_group
    @group = Group.find(params[:group_id])
  end
  def set_chat
    @chat = @group.chats.find(params[:id])
  end
  def chat_params
    params.require(:chat).permit(:content, :image).merge(user_id: current_user.id)
  end
end
