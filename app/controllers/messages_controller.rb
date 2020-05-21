class MessagesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action do
    @conversation = Conversation.find(params[:conversation_id])
  end
  
  # Displays the messages between a sender and receiver id and initiates these messages together
  def index
    @messages = @conversation.messages
    @messages.where("user_id != ? AND read = ?", current_user.id, false).update_all(read: true)
    @message = @conversation.messages.new
  end
  
  # Creates a new message to the conversation path
  def create
    @message = @conversation.messages.new(message_params)
    @message.user = current_user
    if @message.save
      flash[:message] = "Private Message Sent"
      redirect_to conversation_messages_path(@conversation)
    end
  end

  private
    def message_params
      params.require(:message).permit(:body, :user_id)
    end
end