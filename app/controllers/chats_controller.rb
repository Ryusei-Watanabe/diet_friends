class ChatsController < ApplicationController
  before_action :set_group, only: [:index, :create,:destroy]
  before_action :set_chat, only: [:destroy]
  def index
    @chat = Chat.new
    @chats = @group.chats.includes(:user).order( created_at: :desc)
  end
  def create
    @chat = @group.chats.new(chat_params)
    if @chat.save
      redirect_to group_chats_path(@group)
    else
      @messages = @group.messages.includes(:user)
      flash.now[:alert] = 'メッセージを入力してください。'
      render :index
    end
  end
  def destroy
    if @chat.user == current_user
      @chat.destroy
      redirect_to group_chats_path, notice: 'Chat was successfully destroyed.'
    end
  end
  private
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
