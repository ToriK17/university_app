class Api::MessagesController < ApplicationController
  before_action :find_conversation!

  # def find_conversation!
  #   @conversation = Conversation.find_by(id: params[:conversation_id])
  # end

  # def set_conversation
  #   @conversation = Conversation.find_by(id: params[:id])
  # end
  
  def index
    @messages = Message.all.order(id: :desc)
    render 'index.json.jb'
  end

  def show
    @personal_message = PersonalMessage.new
  end
  
  
  def create
    @message = Message.new(
      user_id: current_user.id,
      body: params[:body], 
      conversation_id: params[:conversation_id], 
    )
    @message.save

    ActionCable.server.broadcast "messages_channel", {
      id: @message.id,
      name: @message.user.user_name,
      body: @message.body,
      conversation_id: @message.conversation_id,
      created_at: @message.created_at.strftime("%b %e, %l:%M %p")
    }
    
    render "show.json.jb"
  end
end
